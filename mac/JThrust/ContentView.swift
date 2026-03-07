import SwiftUI
import WebKit

class LocalFileSchemeHandler: NSObject, WKURLSchemeHandler {
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        guard let url = urlSchemeTask.request.url,
              let fileName = url.pathComponents.last else {
            urlSchemeTask.didFailWithError(URLError(.fileDoesNotExist))
            return
        }

        guard let fileURL = Bundle.main.url(forResource: fileName,
                                             withExtension: nil,
                                             subdirectory: "Web") else {
            urlSchemeTask.didFailWithError(URLError(.fileDoesNotExist))
            return
        }

        guard let data = try? Data(contentsOf: fileURL) else {
            urlSchemeTask.didFailWithError(URLError(.cannotOpenFile))
            return
        }

        let mimeType: String
        let ext = (fileName as NSString).pathExtension.lowercased()
        switch ext {
        case "html": mimeType = "text/html"
        case "js":   mimeType = "application/javascript"
        case "css":  mimeType = "text/css"
        case "wav":  mimeType = "audio/wav"
        case "png":  mimeType = "image/png"
        case "webp": mimeType = "image/webp"
        case "svg":  mimeType = "image/svg+xml"
        default:     mimeType = "application/octet-stream"
        }

        let response = URLResponse(url: url,
                                    mimeType: mimeType,
                                    expectedContentLength: data.count,
                                    textEncodingName: ext == "html" ? "utf-8" : nil)
        urlSchemeTask.didReceive(response)
        urlSchemeTask.didReceive(data)
        urlSchemeTask.didFinish()
    }

    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {}
}

struct ContentView: NSViewRepresentable {
    func makeNSView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.setURLSchemeHandler(LocalFileSchemeHandler(), forURLScheme: "app")
        config.mediaTypesRequiringUserActionForPlayback = []

        let script = WKUserScript(
            source: "window.__nativeApp=true;",
            injectionTime: .atDocumentStart,
            forMainFrameOnly: true
        )
        config.userContentController.addUserScript(script)

        let webView = WKWebView(frame: NSRect(x: 0, y: 0, width: 800, height: 600),
                                 configuration: config)

        webView.enclosingScrollView?.hasVerticalScroller = false
        webView.enclosingScrollView?.hasHorizontalScroller = false
        webView.enclosingScrollView?.verticalScrollElasticity = .none
        webView.enclosingScrollView?.horizontalScrollElasticity = .none

        webView.setValue(false, forKey: "drawsBackground")

        #if DEBUG
        webView.isInspectable = true
        #endif

        webView.load(URLRequest(url: URL(string: "app://localhost/j-thrust.html")!))
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {}
}
