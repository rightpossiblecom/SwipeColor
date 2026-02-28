import Link from "next/link";

export default function Download() {
    return (
        <section id="download" className="py-24 md:py-48 relative overflow-hidden">
            {/* Background Highlight */}
            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[400px] bg-indigo-600/20 blur-[120px] rounded-full -z-10" />

            <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div className="MAX-W-4xl mx-auto text-center">
                    <h2 className="mb-8 text-4xl md:text-7xl font-bold tracking-tight text-white leading-tight">
                        Ready to <span className="text-indigo-400">Flow</span>?
                    </h2>
                    <p className="mb-12 text-xl text-zinc-400 leading-relaxed max-w-2xl mx-auto">
                        Download SwipeColor today and experience the puzzle that millions are losing themselves in. Minimalist, challenging, and purely satisfying.
                    </p>

                    <div className="flex flex-col sm:flex-row justify-center items-center gap-6">
                        <a
                            href="#"
                            className="flex h-16 w-full sm:w-auto items-center justify-center gap-4 rounded-2xl bg-white px-10 text-lg font-bold text-black transition-all hover:scale-105 active:scale-95"
                        >
                            <svg className="w-8 h-8" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M17.5 1h-11c-1.4 0-2.5 1.1-2.5 2.5v17c0 1.4 1.1 2.5 2.5 2.5h11c1.4 0 2.5-1.1 2.5-2.5v-17c0-1.4-1.1-2.5-2.5-2.5zm-5.5 21c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm6-4h-12v-14h12v14z" />
                            </svg>
                            App Store
                        </a>

                        <a
                            href="#"
                            className="flex h-16 w-full sm:w-auto items-center justify-center gap-4 rounded-2xl bg-zinc-800 border border-white/10 px-10 text-lg font-bold text-white transition-all hover:scale-105 hover:bg-zinc-700 active:scale-95"
                        >
                            <svg className="w-8 h-8" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M3.609 1.814L13.792 12 3.61 22.186c-.183.18-.3.43-.3.704 0 .55.45.99.99.99a1.006 1.006 0 00.71-.29l10.89-10.89a1 1 0 000-1.41L5.01.39a1 1 0 00-1.4 0 1 1 0 000 1.424z" />
                            </svg>
                            Play Store
                        </a>
                    </div>
                </div>
            </div>
        </section>
    );
}
