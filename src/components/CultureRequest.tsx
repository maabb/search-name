import { useState } from 'react';
import { Mail, Loader2, HeartHandshake, CheckCircle2, MessageSquareHeart } from 'lucide-react';
import { supabase } from '@/lib/supabase';

export function CultureRequest() {
  const [cultureName, setCultureName] = useState('');
  const [message, setMessage] = useState('');
  const [email, setEmail] = useState('');
  const [status, setStatus] = useState<'idle' | 'sending' | 'sent' | 'error'>('idle');
  const [errorMsg, setErrorMsg] = useState('');

  const submit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!cultureName.trim()) return;
    setStatus('sending');
    setErrorMsg('');
    const { error } = await supabase.from('culture_requests').insert({
      culture_name: cultureName.trim(),
      message: message.trim() || null,
      email: email.trim() || null,
    });
    if (error) {
      setErrorMsg(error.message);
      setStatus('error');
      return;
    }
    setStatus('sent');
  };

  if (status === 'sent') {
    return (
      <div className="rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-6 text-center shadow-sm sm:p-8">
        <CheckCircle2 className="mx-auto h-8 w-8 text-[#a4484f]" />
        <h2 className="mt-3 font-serif text-xl font-semibold text-[#3c2d1e]">
          Thank you, your wish is with us
        </h2>
        <p className="mx-auto mt-2 max-w-md text-sm leading-relaxed text-[#7a6a58]">
          We read every suggestion personally. When we add{' '}
          <span className="font-medium text-[#722f37]">{cultureName.trim()}</span>,
          its names will be waiting here for you.
        </p>
      </div>
    );
  }

  return (
    <div className="rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-6 shadow-sm sm:p-8">
      <div className="flex items-center gap-3">
        <span className="flex h-10 w-10 items-center justify-center rounded-xl bg-[#f3dcdf]">
          <MessageSquareHeart className="h-5 w-5 text-[#722f37]" />
        </span>
        <div>
          <h2 className="font-serif text-xl font-semibold text-[#3c2d1e]">
            Missing a culture you love?
          </h2>
          <p className="text-sm text-[#8a7a6b]">
            Tell us which one, we love to hear from you.
          </p>
        </div>
      </div>

      <form onSubmit={submit} className="mt-5 space-y-4">
        <div>
          <label htmlFor="culture-name" className="mb-1.5 block text-sm font-medium text-[#5b4130]">
            Which culture or language? <span className="text-[#a4484f]">*</span>
          </label>
          <input
            id="culture-name"
            type="text"
            required
            maxLength={80}
            value={cultureName}
            onChange={(e) => setCultureName(e.target.value)}
            placeholder="e.g. Persian, Hindi, Spanish, Amharic…"
            className="w-full rounded-xl border-0 bg-[#f9f4ec] py-3 px-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] transition-shadow placeholder:text-[#b09a83] focus:outline-none focus:ring-2 focus:ring-[#a4484f]"
          />
        </div>

        <div>
          <label htmlFor="culture-message" className="mb-1.5 block text-sm font-medium text-[#5b4130]">
            Anything else you'd love to see?{' '}
            <span className="text-xs font-normal text-[#8a7a6b]">optional</span>
          </label>
          <textarea
            id="culture-message"
            rows={3}
            maxLength={500}
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            placeholder='e.g. names meaning "light" for a girl, or names that work in both English and Arabic…'
            className="w-full resize-none rounded-xl border-0 bg-[#f9f4ec] py-3 px-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] transition-shadow placeholder:text-[#b09a83] focus:outline-none focus:ring-2 focus:ring-[#a4484f]"
          />
        </div>

        <div>
          <label htmlFor="culture-email" className="mb-1.5 block text-sm font-medium text-[#5b4130]">
            Your email <span className="text-xs font-normal text-[#8a7a6b]">optional, only if you'd like a reply</span>
          </label>
          <div className="relative">
            <Mail className="pointer-events-none absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-[#b09a83]" />
            <input
              id="culture-email"
              type="email"
              maxLength={120}
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="you@example.com"
              className="w-full rounded-xl border-0 bg-[#f9f4ec] py-3 pl-11 pr-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] transition-shadow placeholder:text-[#b09a83] focus:outline-none focus:ring-2 focus:ring-[#a4484f]"
            />
          </div>
        </div>

        {status === 'error' && (
          <p className="rounded-xl bg-[#f3dcdf] px-4 py-3 text-sm text-[#722f37]">
            Something went wrong sending your suggestion, please try again.
            {errorMsg ? ` (${errorMsg})` : ''}
          </p>
        )}

        <button
          type="submit"
          disabled={status === 'sending' || !cultureName.trim()}
          className="inline-flex w-full items-center justify-center gap-2 rounded-xl bg-[#722f37] px-5 py-3 text-sm font-semibold text-[#fefbf7] shadow-sm transition-all hover:bg-[#5d262d] disabled:cursor-not-allowed disabled:opacity-50 sm:w-auto"
        >
          {status === 'sending' ? (
            <>
              <Loader2 className="h-4 w-4 animate-spin" />
              Sending…
            </>
          ) : (
            <>
              <HeartHandshake className="h-4 w-4" />
              Send your suggestion
            </>
          )}
        </button>
      </form>
    </div>
  );
}
