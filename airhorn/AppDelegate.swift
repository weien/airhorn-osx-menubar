import Cocoa

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {

    private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setupMenuIcon()
    }

    /// Sets the menu image and action
    private func setupMenuIcon() {
        statusItem.button?.action = #selector(playAirhorn(_:))
        let menuImage = NSImage(named: "airhorn")
        menuImage?.isTemplate = true
        statusItem.button?.image = menuImage
    }

    /// Plays airhorn sound. Supports playing multiple sounds simultaneously.
    @objc private func playAirhorn(_ sender: AnyObject?) {
        guard let airhorn = NSSound(named: "airhorn")?.copy() as? NSSound else { fatalError() }
        airhorn.play()
    }

}

