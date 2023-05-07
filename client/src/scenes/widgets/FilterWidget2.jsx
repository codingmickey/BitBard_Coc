import React from 'react';
import { makeStyles } from '@mui/styles';
import {
  Grid,
  Box,
  Button,
  Typography,
  Divider,
  Radio,
  RadioGroup,
  FormControl,
  FormControlLabel,
  Slider
} from '@mui/material';

const useStyles = makeStyles((theme) => ({
  filters: {
    marginBottom: theme.spacing(4),
    padding: '1.5rem 1.5rem 0.75rem 1.5rem',
    backgroundColor: theme.palette.background.alt,
    borderRadius: '0.75rem'
  },
  formControl: {
    marginTop: theme.spacing(2)
  },
  divider: {
    margin: theme.spacing(2, 0)
  },
  slider: {
    marginTop: theme.spacing(2)
  }
}));

const Filters = () => {
  const classes = useStyles();

  const continents = [
    { value: 'asia', label: 'Asia' },
    { value: 'africa', label: 'Africa' },
    { value: 'europe', label: 'Europe' },
    { value: 'north-america', label: 'North America' },
    { value: 'south-america', label: 'South America' },
    { value: 'australia', label: 'Australia' }
  ];

  const [priceRange, setPriceRange] = React.useState([0, 10000]);
  const handlePriceRangeChange = (event, newValue) => {
    setPriceRange(newValue);
  };

  const [continent, setContinent] = React.useState('');
  const handleContinentChange = (event) => {
    setContinent(event.target.value);
  };

  const [departureMonth, setDepartureMonth] = React.useState('');
  const handleDepartureMonthChange = (event) => {
    setDepartureMonth(event.target.value);
  };

  const marks = [
    { value: 1, label: '1 week' },
    { value: 2, label: '2 weeks' },
    { value: 3, label: '3 weeks' },
    { value: 4, label: '4 weeks' }
  ];

  const [duration, setDuration] = React.useState([1, 4]);
  const handleDurationChange = (event, newValue) => {
    setDuration(newValue);
  };

  return (
    <Box className={classes.filters}>
      <Typography variant="h6" gutterBottom>
        Filters
      </Typography>
      <Divider className={classes.divider} />
      <Box>
        <Typography variant="subtitle1" gutterBottom>
          Price Range (₹)
        </Typography>
        <Slider
          value={priceRange}
          onChange={handlePriceRangeChange}
          valueLabelDisplay="auto"
          min={0}
          max={10000}
          className={classes.slider}
        />
      </Box>
      <Divider className={classes.divider} />
      <Box>
        <Typography variant="subtitle1" gutterBottom>
          Continent
        </Typography>
        <FormControl component="fieldset" className={classes.formControl}>
          <RadioGroup aria-label="continent" name="continent" value={continent} onChange={handleContinentChange}>
            {continents.map((continent) => (
              <FormControlLabel
                key={continent.value}
                value={continent.value}
                control={<Radio />}
                label={continent.label}
              />
            ))}
          </RadioGroup>
        </FormControl>
      </Box>
      <Divider className={classes.divider} />
      <Box>
        <Typography variant="subtitle1" gutterBottom>
          Departure Month
        </Typography>
        <FormControl component="fieldset" className={classes.formControl}>
          <Grid container spacing={1}>
            <Grid item>
              <Button variant="outlined" color="primary" value="january">
                January
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="february">
                February
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="march">
                March
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="april">
                April
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="may">
                May
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="june">
                June
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="july">
                July
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="august">
                August
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="september">
                September
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="october">
                October
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="november">
                November
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary" value="december">
                December
              </Button>
            </Grid>
          </Grid>
        </FormControl>
      </Box>
      <Divider className={classes.divider} />
      <Box>
        <Typography variant="subtitle1" gutterBottom>
          Duration
        </Typography>
        <Slider
          value={duration}
          onChange={handleDurationChange}
          valueLabelDisplay="auto"
          min={1}
          max={4}
          marks={marks}
          className={classes.slider}
        />
      </Box>
    </Box>
  );
};

export default Filters;
