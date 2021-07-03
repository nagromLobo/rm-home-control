import React from 'react';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';

import LightInfo from '../../../lights/components/LightInfo';

import styles from './Navbar.module.less';

const Navbar = () => {
  return (
    <AppBar position='static'>
      <Toolbar>
        <div className={styles.large}>Home Control</div>{' '}
      </Toolbar>
    </AppBar>
  );
};

export default Navbar;
