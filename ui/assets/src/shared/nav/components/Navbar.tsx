import React from 'react';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';

import LightInfo from '../../../lights/components/LightInfo';

import styles from './Navbar.module.less';

const Navbar = () => {
  return (
    <AppBar position='static'>
      <Toolbar>
        <div className={styles.large}>meow</div>{' '}
        <LightInfo light={{ id: 'hue-1', is_on: true }}></LightInfo>
      </Toolbar>
    </AppBar>
  );
};

export default Navbar;
