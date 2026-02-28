import Navbar from "../../components/layout/Navbar";
import Footer from "../../components/landing/Footer";

export default function PrivacyPolicy() {
    const lastUpdated = "February 28, 2026";

    return (
        <div className="min-h-screen bg-black text-zinc-300">
            <Navbar />
            <main className="max-w-4xl mx-auto px-6 py-32">
                <h1 className="text-4xl md:text-6xl font-bold text-white mb-8">Privacy Policy</h1>
                <p className="text-zinc-500 mb-12 italic">Last updated: {lastUpdated}</p>

                <div className="space-y-12">
                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Introduction</h2>
                        <p className="leading-relaxed mb-4">
                            At SwipeColor, we believe your privacy is as important as the simplicity of our game. This Privacy Policy outlines how we handle data and what we collect (spoiler: it&apos;s very little).
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Data Collection</h2>
                        <p className="leading-relaxed mb-4">
                            SwipeColor is designed to be a local-first experience. We do not require account creation, nor do we collect personally identifiable information (PII) such as your name, email address, or phone number within the game itself.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Local Storage</h2>
                        <p className="leading-relaxed mb-4">
                            Your game progress, including high scores, unlocked levels, and earned stars, is stored locally on your device using your system&apos;s standard storage mechanisms (such as shared_preferences). This data never leaves your device unless you choose to back up your device to a cloud service (e.g., iCloud or Google Drive).
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Third-Party Services</h2>
                        <p className="leading-relaxed mb-4">
                            We may use standard platform services provided by the Apple App Store or Google Play Store for crash reporting or basic anonymous analytics to help us improve the game&apos;s performance. These services are governed by their respective privacy policies.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Changes to This Policy</h2>
                        <p className="leading-relaxed mb-4">
                            We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the &quot;Last updated&quot; date at the top.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Contact Us</h2>
                        <p className="leading-relaxed">
                            If you have any questions about our privacy practices, please contact us at support@swipecolor.com.
                        </p>
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    );
}
