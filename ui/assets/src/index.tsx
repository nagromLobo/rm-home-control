import { ThemeProvider } from '@material-ui/core';
import React from 'react';
import ReactDom from 'react-dom';
import Navbar from './shared/nav/components/Navbar';
import theme from './theme';

const name = 'Oliver';

const App = () => {
    return (
        <ThemeProvider theme={theme}>
            <Navbar /><div>How's it going {name}!</div>
        </ThemeProvider>
    )
}

ReactDom.render(<App />, document.getElementById('main'));

