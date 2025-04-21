import React from 'react';
import { Box, Paper, Typography } from '@mui/material';

const Home: React.FC = () {
  return (
    <Box sx={{ maxWidth: 800, mx: 'auto' }}>
      <Typography variant='h4' component='h1' gutterBottom>Welcome to the Home Page</Typography>
    </Box>
  );
}

export default Home;
