import { useMutation, useQuery } from 'react-query';

import { queryClient, request } from '../remoteState';
import { LightMutation, LightType } from './types';

const lightsURL = () => '/api/lights';
const lightsQueryKey = lightsURL;

const lightURL = (id: number | string) => `/api/lights/${id}`;
const lightQueryKey = lightURL;

const invalidateLights = (id?: number | string) => {
  queryClient.invalidateQueries(lightsQueryKey());
  if (id) {
    queryClient.invalidateQueries(lightQueryKey(id));
  }
};

export const useLightsQuery = () => {
  return useQuery(lightsQueryKey(), () => request<LightType[]>({ url: lightsURL() }));
};

export const useLightQuery = (id?: number | string) => {
  return useQuery(lightQueryKey(id), () => request<LightType>({ url: lightURL(id) }), {
    enabled: !!id,
  });
};

export const useUpdateLightMutation = (id: number | string) => {
  return useMutation(
    lightQueryKey(id),
    (body: LightMutation) => request({ url: lightURL(id), method: 'PATCH', body }),
    { onSettled: () => invalidateLights(id) }
  );
};
