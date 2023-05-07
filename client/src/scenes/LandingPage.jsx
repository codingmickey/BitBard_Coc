import React from 'react';
import { Box, Button, Container, Grid, Typography } from '@material-ui/core';

const LandingPage = () => {
  return (
    <Box sx={{ backgroundColor: '#F0F0F0', minHeight: '100vh' }}>
      <Container maxWidth="lg">
        <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '80vh' }}>
          <Grid container spacing={2}>
            <Grid item xs={12}>
              <Typography variant="h2" align="center" gutterBottom>
                Find your travel partner
              </Typography>
              <Typography variant="subtitle1" align="center" gutterBottom>
                Join someone's itinerary or find a travel partner to plan your next adventure with
              </Typography>
            </Grid>
            <Grid item xs={12} sm={6}>
              <Button fullWidth variant="contained">
                Join an itinerary
              </Button>
            </Grid>
            <Grid item xs={12} sm={6}>
              <Button fullWidth variant="outlined">
                Find a travel partner
              </Button>
            </Grid>
          </Grid>
        </Box>
      </Container>
    </Box>
  );
};

export default LandingPage;
