import React from 'react';
import { Grid, Card, CardContent, CardMedia, Typography } from '@mui/material';

import Navbar from './navbar';

const people = [
  { name: 'John Doe', jobTitle: 'Software Engineer', imageUrl: 'https://via.placeholder.com/150' },
  { name: 'Jane Doe', jobTitle: 'Product Manager', imageUrl: 'https://via.placeholder.com/150' },
  { name: 'Bob Smith', jobTitle: 'UX Designer', imageUrl: 'https://via.placeholder.com/150' },
  { name: 'Alice Johnson', jobTitle: 'Data Analyst', imageUrl: 'https://via.placeholder.com/150' }
];

const PeopleGrid = () => {
  return (
    <>
      <Navbar />
      <Grid container spacing={2}>
        {people.map((person) => (
          <Grid item xs={12} sm={6} md={4} lg={3} key={person.name}>
            <Card>
              <CardMedia component="img" alt={person.name} height="150" image={person.imageUrl} />
              <CardContent>
                <Typography variant="h6" component="h2">
                  {person.name}
                </Typography>
                <Typography color="textSecondary" gutterBottom>
                  {person.jobTitle}
                </Typography>
              </CardContent>
            </Card>
          </Grid>
        ))}
      </Grid>
    </>
  );
};

export default PeopleGrid;
