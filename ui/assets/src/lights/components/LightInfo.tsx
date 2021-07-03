import React from 'react';

import Loading from '../../shared/layout/components/Loading';
import { useUpdateLightMutation } from '../remoteState';
import { LightType } from '../types';

import styles from './LightInfo.module.less';

type LightInfoProps = {
  light: LightType;
};

const LightInfo = ({ light }: LightInfoProps) => {
  const { mutate: updateLight, isLoading: isUpdating } = useUpdateLightMutation(light.id);

  return (
    <button
      className={`${light.is_on ? styles.on : ''}`}
      onClick={() => updateLight({ is_on: !!light.is_on })}
    >
      {isUpdating ? <Loading /> : light.id}
    </button>
  );
};

export default LightInfo;
