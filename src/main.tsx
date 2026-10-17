import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import App from './App.tsx';
import { AdminPage } from '@/pages/Admin';
import './index.css';

const isAdminPath = window.location.pathname.replace(/\/+$/, '') === '/admin';

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    {isAdminPath ? <AdminPage /> : <App />}
  </StrictMode>
);
