import Link from "next/link";
import Image from "next/image";

export default function Hero() {
    return (
        <section className="relative overflow-hidden pt-36 pb-20 md:pt-48 md:pb-32">
            {/* Background Orbs */}
            <div className="absolute top-[-20%] left-[-10%] h-[150%] w-[150%] pointer-events-none select-none">
                <div className="absolute top-0 left-0 h-96 w-96 rounded-full bg-indigo-500/20 blur-[100px] animate-pulse" />
                <div className="absolute bottom-1/4 right-0 h-96 w-96 rounded-full bg-emerald-500/10 blur-[100px] animate-pulse delay-500" />
            </div>

            <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-16 items-center">
                    <div className="z-10">
                        <div className="mb-6 inline-flex items-center gap-2 rounded-full bg-indigo-500/10 px-3 py-1 ring-1 ring-indigo-500/20 backdrop-blur-sm">
                            <span className="text-xs font-semibold uppercase tracking-wider text-indigo-400">
                                New on Mobile
                            </span>
                        </div>

                        <h1 className="mb-6 text-5xl md:text-7xl font-bold tracking-tight text-white leading-[1.1]">
                            Connect. <br />
                            <span className="text-transparent bg-clip-text bg-gradient-to-r from-indigo-400 to-emerald-400">
                                Without Lifting.
                            </span>
                        </h1>

                        <p className="mb-10 text-lg md:text-xl text-zinc-400 leading-relaxed max-w-lg">
                            SwipeColor is the minimalist puzzle game for deep focus.
                            Draw one continuous line to connect all dots in one stroke.
                            Clean. Smart. Satisfying.
                        </p>

                        <div className="flex flex-wrap gap-4">
                            <Link
                                href="#download"
                                className="group relative inline-flex h-14 items-center justify-center overflow-hidden rounded-full bg-white px-8 font-bold text-black shadow-2xl transition-all duration-300 hover:scale-105 active:scale-95"
                            >
                                Start Playing
                                <div className="absolute inset-0 bg-gradient-to-r from-transparent via-black/5 to-transparent -translate-x-full group-hover:translate-x-full transition-transform duration-1000" />
                            </Link>

                            <Link
                                href="#how-it-works"
                                className="inline-flex h-14 items-center justify-center rounded-full border border-white/20 px-8 text-base font-semibold text-white transition-all hover:bg-white/5 active:scale-95"
                            >
                                Watch Trailer
                            </Link>
                        </div>
                    </div>

                    <div className="relative group perspective">
                        <div className="relative z-10 w-full max-w-sm mx-auto aspect-[9/19.5] rounded-[3rem] p-4 bg-zinc-900 shadow-2xl ring-1 ring-zinc-800 transition-transform duration-500 group-hover:rotate-y-6">
                            <div className="absolute inset-0 rounded-[3rem] bg-gradient-to-br from-indigo-500/20 to-transparent" />

                            <div className="relative h-full w-full rounded-[2.2rem] overflow-hidden bg-black border border-white/5">
                                {/* Mock Gameplay */}
                                <div className="absolute inset-0 bg-zinc-950 p-8 flex flex-col">
                                    <header className="flex justify-between items-center mb-12">
                                        <span className="text-zinc-500 text-xs font-medium">LEVEL 10</span>
                                        <div className="flex gap-1">
                                            <div className="h-4 w-4 rounded-full bg-yellow-500" />
                                            <div className="h-4 w-4 rounded-full bg-yellow-500" />
                                            <div className="h-4 w-4 rounded-full bg-zinc-800" />
                                        </div>
                                    </header>

                                    <div className="flex-1 relative">
                                        {/* Dots representation */}
                                        {[
                                            { top: '10%', left: '20%', color: 'bg-indigo-500' },
                                            { top: '30%', left: '70%', color: 'bg-emerald-500' },
                                            { top: '60%', left: '30%', color: 'bg-indigo-500 shadow-[0_0_15px_rgba(99,102,241,0.5)]' },
                                            { top: '80%', left: '80%', color: 'bg-indigo-500' }
                                        ].map((dot, i) => (
                                            <div
                                                key={i}
                                                className={`absolute w-6 h-6 rounded-full ${dot.color}`}
                                                style={{ top: dot.top, left: dot.left }}
                                            />
                                        ))}

                                        {/* The Line */}
                                        <svg className="absolute inset-0 h-full w-full overflow-visible pointer-events-none opacity-50">
                                            <path
                                                d="M 20 10 L 70 30 L 30 60 L 80 80"
                                                fill="none"
                                                stroke="white"
                                                strokeWidth="1.5"
                                                strokeDasharray="5,5"
                                                className="animate-pulse"
                                            />
                                            <path
                                                d="M 20 10 L 70 30 L 30 60"
                                                fill="none"
                                                stroke="#6366F1"
                                                strokeWidth="3"
                                                strokeLinecap="round"
                                                strokeLinejoin="round"
                                            />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 -z-10 w-64 h-64 rounded-full bg-indigo-500/30 blur-[120px]" />
                    </div>
                </div>
            </div>
        </section>
    );
}
