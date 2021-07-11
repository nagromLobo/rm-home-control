import React from 'react';

import Loading from '../../shared/layout/components/Loading';
import { useLightsQuery, useUpdateLightMutation } from '../remoteState';
import { LightType } from '../types';

import styles from './Lights.module.less';

type LightButtonProps = {
  light: LightType;
};

const LightButton = ({ light }: LightButtonProps) => {
  const { mutate: update } = useUpdateLightMutation(light.id);
  return (
    <button
      type='button'
      key={light.id}
      onClick={() => update({ is_on: !light.is_on })}
      className={`${styles.light} ${light.is_on ? styles.on : ''}`}
    >
      {light.name}
    </button>
  );
};

const Lights = () => {
  const { data: lights, isLoading: areLightsLoading } = useLightsQuery();
  // const { data: lightDetails } = useLightQuery(selectedLight?.id);

  if (areLightsLoading) {
    return <Loading />;
  }
  return (
    <div>
      <div className={styles.lights}>
        {lights.map((light) => (
          <LightButton key={light.id} light={light} />
        ))}
      </div>
    </div>
  );
};

export default Lights;
