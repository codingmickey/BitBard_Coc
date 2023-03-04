import { useState } from 'react';
import { Grid, Paper, Typography, TextField, Button } from '@mui/material';
import { makeStyles } from '@mui/styles';

import Navbar from './navbar/index.jsx';

const useStyles = makeStyles((theme) => ({
  root: {
    padding: theme.spacing(2)
  },
  filterContainer: {
    marginRight: theme.spacing(2)
  },
  jobListingContainer: {
    marginLeft: theme.spacing(2)
  },
  filterTitle: {
    marginBottom: theme.spacing(2)
  },
  filterTextField: {
    marginBottom: theme.spacing(2)
  }
}));

const TravelPage = () => {
  const classes = useStyles();

  const [locationFilter, setLocationFilter] = useState('');
  const [startDateFilter, setStartDateFilter] = useState('');
  const [endDateFilter, setEndDateFilter] = useState('');

  const handleLocationFilterChange = (event) => {
    setLocationFilter(event.target.value);
  };

  const handleStartDateFilterChange = (event) => {
    setStartDateFilter(event.target.value);
  };

  const handleEndDateFilterChange = (event) => {
    setEndDateFilter(event.target.value);
  };

  const handleFilterReset = () => {
    setLocationFilter('');
    setStartDateFilter('');
    setEndDateFilter('');
  };

  return (
    <>
      <Navbar />
      <div className={classes.root}>
        <Grid container>
          <Grid item xs={12} md={4} className={classes.filterContainer}>
            <Paper elevation={3} className={classes.paper}>
              <Typography variant="h6" className={classes.filterTitle}>
                Filters
              </Typography>
              <TextField
                label="Location"
                variant="outlined"
                size="small"
                fullWidth
                value={locationFilter}
                onChange={handleLocationFilterChange}
                className={classes.filterTextField}
              />
              <TextField
                label="Start Date"
                variant="outlined"
                size="small"
                type="date"
                fullWidth
                value={startDateFilter}
                onChange={handleStartDateFilterChange}
                className={classes.filterTextField}
              />
              <TextField
                label="End Date"
                variant="outlined"
                size="small"
                type="date"
                fullWidth
                value={endDateFilter}
                onChange={handleEndDateFilterChange}
                className={classes.filterTextField}
              />
              <Button variant="contained" onClick={handleFilterReset}>
                Reset Filters
              </Button>
            </Paper>
          </Grid>
          <Grid item xs={12} md={8} className={classes.jobListingContainer}>
            <Paper elevation={3} className={classes.paper}>
              {/* TODO: Render job listings here */}
            </Paper>
          </Grid>
        </Grid>
      </div>
    </>
  );
};

export default TravelPage;
