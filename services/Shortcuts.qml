pragma Singleton
import Quickshell

Singleton {
    signal triggered(string action)

    function trigger(action: string) {
        triggered(action)
    }
}
