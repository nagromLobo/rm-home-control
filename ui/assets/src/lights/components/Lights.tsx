import React, { useState } from 'react';

import Loading from '../../shared/layout/components/Loading';
import { useLightQuery, useLightsQuery } from '../remoteState';
import { LightType } from '../types';
import LightInfo from './LightInfo';

const Lights = () => {
  const [selectedLight, setSelectedLight] = useState<LightType | null>(null);

  const { data: lights, isLoading: areLightsLoading } = useLightsQuery();
  const { data: lightDetails } = useLightQuery(selectedLight?.id);

  if (areLightsLoading) {
    return <Loading />;
  }
  return (
    <div>
      {lightDetails && <LightInfo light={lightDetails} />}
      <div>
        {lights.map((light) => (
          <button type='button' key={light.id} onClick={() => setSelectedLight(light)}>
            {JSON.stringify(light)}
          </button>
        ))}
      </div>
    </div>
  );
};

export default Lights;
