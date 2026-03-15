# J-THRUST Levi Edition — Roadmap

## ✅ Phase 0 — Grundgerüst (erledigt)
– [x] Spiel-Engine mit 5 Modi (Classic, Arena, Levi, Duel, Coop)
– [x] 6 Levi-Übungslevel (Ringe, Pfad, Zahlen, Wort, Pod, Fliegen)
– [x] 10 Classic-Levels mit Marching-Squares-Terrain
– [x] Audio-System (3 Explosions-Varianten, Schub-Sound, Schuss)
– [x] Animiertes Titelscreen-Logo (Schiff, J-Hook, Ball, Tether)
– [x] Mac App (SwiftUI + WKWebView, `nativeSpeak` Bridge)
– [x] Settings mit Presets + Custom-Speicherung
– [x] Coop 2-Player-System (Crew, Schild, Seilmeister)

## ✅ Phase 1 — Menü-Umbau (erledigt)
– [x] Flaches 6-Item-Hauptmenü: LEVI, KLASSIK, ARENA, DUELL, COOP, EINSTELLUNGEN
– [x] Jeder Punkt direkt erreichbar, kein Verschachteln mehr
– [x] Einstellungen wieder vom Hauptmenü aus zugänglich
– [x] ESC-Navigation überall konsistent

## ✅ Phase 2 — Duel-Modus (erledigt)
– [x] 3 Maps portiert (The Pit, Columns, Crossfire)
– [x] Bot-AI mit Wandvermeidung (niedriger als CPMA: Thrust *0.6, Schuss 0.02)
– [x] Online-Modus via WebSocket (shared Server j-thrust-duel.onrender.com)
– [x] Score First to 3 (statt 5 in CPMA)
– [x] Rot/Blau Schiffe, farbkodierte Bullets, graue Wände
– [x] Match-End mit Revanche-Option

## ✅ Phase 3 — Coop-Polish (erledigt)
– [x] Coop-Beschreibungen kindgerechter
– [x] Flow verifiziert: COOP → Typ wählen → LEVI/ARENA

## 🕹️ Phase 4 — Joystick-Support
– [ ] Competition Pro Extra USB bestellen
– [ ] Testen wie er sich in Safari/WKWebView meldet (Gamepad API)
– [ ] Standard-Belegung für Joystick: Stick=Richtungen, Button 0=Schuss
– [ ] In Einstellungen: Steuerungs-Sektion zum Umbelegen (wie jedes normale Spiel)
– [ ] Levi-Modus: Stick HOCH=Gas, LINKS/RECHTS=Drehen, Feuerknopf=Schuss
– [ ] Andere Modi: Analog-Stick für Rotation, Trigger für Gas
– [ ] Deadzone-Kalibrierung

## 📦 Phase 5 — Mac App Release
– [ ] Joystick-Support in WKWebView verifizieren
– [ ] App-Icon finalisieren
– [ ] DMG bauen + testen
– [ ] Notarisierung (Apple Developer Account nötig?)

## 🎨 Phase 6 — Polish
– [ ] Levi-spezifische Sounds (kindgerechter, ermutigend)
– [ ] Fortschritts-Tracking (welche Level gemeistert)
– [ ] Schwierigkeitsanpassung pro Levi-Level
