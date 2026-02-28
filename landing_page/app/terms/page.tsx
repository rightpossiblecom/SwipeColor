import Navbar from "../../components/layout/Navbar";
import Footer from "../../components/landing/Footer";

export default function TermsOfService() {
    const lastUpdated = "February 28, 2026";

    return (
        <div className="min-h-screen bg-black text-zinc-300">
            <Navbar />
            <main className="max-w-4xl mx-auto px-6 py-32">
                <h1 className="text-4xl md:text-6xl font-bold text-white mb-8">Terms of Service</h1>
                <p className="text-zinc-500 mb-12 italic">Last updated: {lastUpdated}</p>

                <div className="space-y-12">
                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Agreement</h2>
                        <p className="leading-relaxed mb-4">
                            By downloading or using the SwipeColor mobile application (the &quot;Service&quot;), you agree to be bound by these Terms of Service. If you disagree with any part of the terms, you must not use the Service.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">License to Use</h2>
                        <p className="leading-relaxed mb-4">
                            We grant you a non-exclusive, non-transferable, revocable license to use SwipeColor for personal, non-commercial use on a compatible mobile device.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">User Conduct</h2>
                        <p className="leading-relaxed mb-4">
                            You agree not to modify, reverse engineer, or attempt to extract the source code of the Service. You shall not use the Service for any unlawful or prohibited purpose.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">User Progress</h2>
                        <p className="leading-relaxed mb-4">
                            All in-game progress, level completions, and earned stars are stored locally. We are not responsible for loss of progress due to app deletion or device failure.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Intellectual Property</h2>
                        <p className="leading-relaxed mb-4">
                            SwipeColor, including all visual elements, logic, and branding, is the intellectual property of its creator. You may not use these for any purpose without express permission.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Limitation of Liability</h2>
                        <p className="leading-relaxed mb-4">
                            The Service is provided &quot;as is&quot; without any warranties. We shall not be liable for any damages arising out of your use or inability to use the Service.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Termination</h2>
                        <p className="leading-relaxed mb-4">
                            We reserve the right to terminate or suspend access to our Service immediately, without prior notice or liability, for any reason whatsoever.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mb-6">Contact Us</h2>
                        <p className="leading-relaxed">
                            If you have any questions about these Terms, please contact us at support@swipecolor.com.
                        </p>
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    );
}
