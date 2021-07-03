import { ThemeProvider } from '@material-ui/core';
import React from 'react';
import ReactDom from 'react-dom';
import { QueryClientProvider } from 'react-query/react';

import Lights from './lights/components/Lights';
import { queryClient } from './remoteState';
import Navbar from './shared/nav/components/Navbar';
import theme from './theme';

const App = () => {
  return (
    <QueryClientProvider client={queryClient}>
      <ThemeProvider theme={theme}>
        <Navbar />
        <Lights />
      </ThemeProvider>
    </QueryClientProvider>
  );
};

ReactDom.render(<App />, document.getElementById('main'));
