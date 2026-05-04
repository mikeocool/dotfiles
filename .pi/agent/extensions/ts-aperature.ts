import type { ExtensionAPI } from "@mariozechner/pi-coding-agent";

const GATEWAY = "http://ai";

export default function (pi: ExtensionAPI) {
    pi.registerProvider("anthropic", {
        baseUrl: `${GATEWAY}`,
        apiKey: "-",
    });
    pi.registerProvider("openai", {
        baseUrl: `${GATEWAY}/v1`,
        apiKey: "-",
    });
    // TODO openrouter
}
