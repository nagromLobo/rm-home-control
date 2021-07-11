import { QueryClient } from 'react-query';

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 5 * 1000 * 60,
      cacheTime: 10 * 1000 * 60,
      retry: 2,
      refetchOnWindowFocus: false,
    },
  },
});

type FetchConfig = {
  url: string;
  method?: 'GET' | 'POST' | 'DELETE' | 'PATCH';
  body?: object;
};

export const request = async <T>({ url, method = 'GET', body }: FetchConfig): Promise<T> => {
  try {
    const response = await fetch(url, {
      method,
      ...(body && {
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
      }),
    });
    // TODO better handling of error state
    if (!response.ok) {
      throw new Error('Something went wrong!');
    }
    return (await response.json()).data;
  } catch (err) {
    throw new Error('Something went wrong: ' + err);
  }
};
