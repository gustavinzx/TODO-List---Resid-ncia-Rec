import axios from 'axios';

const api = axios.create({
    baseURL: process.env.NEXT_PUBLIC_API_URL || 'http://localhost:3001/api',
});

// Injeta o token JWT automaticamente em toda requisição
api.interceptors.request.use((config) => {
    if (typeof window !== 'undefined') {
        const token = localStorage.getItem('token');
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
    }
    return config;
});

// Remove o token se der erro de autenticação (ex: token velho)
api.interceptors.response.use(
    (response) => response,
    (error) => {
        if (error.response?.status === 401 || error.response?.status === 403) {
            if (typeof window !== 'undefined') {
                localStorage.removeItem('token');
                localStorage.removeItem('usuario');
                window.dispatchEvent(new Event('localStorageChange'));
                window.location.href = '/login';
            }
        }
        return Promise.reject(error);
    }
);

export const fetcher = (url: string) => api.get(url).then(res => res.data);

export default api;
