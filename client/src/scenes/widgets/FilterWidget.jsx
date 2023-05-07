import {
  ManageAccountsOutlined,
  EditOutlined,
  LocationOnOutlined,
  WorkOutlineOutlined,
  CheckBox
} from '@mui/icons-material';
import {
  Box,
  Typography,
  Divider,
  useTheme,
  Autocomplete,
  TextField,
  FormGroup,
  FormControlLabel,
  Checkbox,
  Slider,
  Radio
} from '@mui/material';
import UserImage from '../../components/UserImage';
import FlexBetween from '../../components/FlexBetween';
import WidgetWrapper from '../../components/WidgetWrapper';
import { useSelector } from 'react-redux';
import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import FilterAltIcon from '@mui/icons-material/FilterAlt';
import { jobsCategory } from '../../data/jobCategory';
import { jobLocation } from '../../data/jobLocation';
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';

const FilterWidget = ({ userId }) => {
  const [user, setUser] = useState(null);
  const { palette } = useTheme();
  const navigate = useNavigate();
  const token = useSelector((state) => state.token);
  const dark = palette.neutral.dark;
  const medium = palette.neutral.medium;
  const main = palette.neutral.main;
  const [jobsCategoryValue, setJobsCategoryValue] = useState(null);
  const [jobLocationValue, setJobLocationValue] = useState(null);
  const [workFromHome, setWorkFromHome] = useState(false);

  const [type, setType] = useState('All');
  const [partTime, setPartTime] = useState(false);
  const getUser = async () => {
    const response = await fetch(`http://localhost:3001/users/${userId}`, {
      method: 'GET',
      headers: { Authorization: `Bearer ${token}` }
    });
    const data = await response.json();
    setUser(data);
  };

  useEffect(() => {
    getUser();
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  if (!user) {
    return null;
  }

  const { firstName, lastName, location, occupation, viewedProfile, impressions, friends } = user;

  function valuetext(value) {
    return `${value}K`;
  }

  const marks = [
    { value: 0, label: 0 },
    {
      value: 10,
      label: '1K'
    },
    {
      value: 20,
      label: '2K'
    },
    {
      value: 40,
      label: '4K'
    },
    {
      value: 60,
      label: '6K'
    },
    {
      value: 80,
      label: '8K'
    },
    {
      value: 100,
      label: '10K'
    }
  ];

  return (
    <WidgetWrapper sx={{ position: 'fixed' }}>
      {/* FIRST ROW */}
      <Box display="flex" alignItems="center" gap="0.5rem" justifyContent="center" pb="1.1rem">
        <FilterAltIcon />
        <Typography color={dark} fontWeight="500">
          Filters
        </Typography>
      </Box>
      <Box p="1rem 0">
        {/* <Box display="flex" alignItems="center" justifyContent="center" gap="1rem" mb="1.7rem">
          <Autocomplete
            disablePortal
            id="jobs-category"
            options={jobsCategory}
            value={jobsCategoryValue}
            onChange={(event, newValue) => {
              setJobsCategoryValue(newValue);
            }}
            sx={{ width: 300 }}
            renderInput={(params) => <TextField {...params} label="Category" />}
          />
        </Box> */}

        <Box display="flex" alignItems="center" justifyContent="center" gap="1rem" mb="1rem">
          <Autocomplete
            disablePortal
            id="job-location"
            options={jobLocation}
            value={jobLocationValue}
            onChange={(event, newValue) => {
              setJobLocationValue(newValue);
            }}
            sx={{ width: 300 }}
            renderInput={(params) => <TextField {...params} label="Destination" />}
          />
        </Box>

        <Box p="0 1.5rem 1rem">
          <FormGroup justifyContent="center">
            <FormControlLabel
              control={
                <Radio
                  checked={type === 'Intership' || type === 'All' ? true : false}
                  onChange={(e) => {
                    setPartTime(e.target.checked);
                    localStorage.setItem('type', e.target.value);
                  }}
                />
              }
              label="Intership"
            />
            <FormControlLabel
              control={
                <Radio
                  checked={!partTime}
                  onChange={(e) => {
                    setPartTime(!e.target.checked);
                    localStorage.setItem('type', e.target.value);
                  }}
                />
              }
              label="Job"
            />
          </FormGroup>
        </Box>

        <Box alignItems="center" justifyContent="center">
          <Typography color={dark} textAlign="center" mb="1.7rem">
            Desired minimum monthly stipend (₹)
          </Typography>
          <Box textAlign="center">
            <Slider
              track="inverted"
              sx={{ width: '70%' }}
              aria-labelledby="track-inverted-slider"
              getAriaValueText={valuetext}
              defaultValue={0}
              marks={marks}
            />
          </Box>
        </Box>
        <Box display="flex" alignItems="center" justifyContent="center">
          <Typography color="primary" variant="h5" type textAlign="start" mt="1.7rem">
            View more filters
          </Typography>
          <Box color="primary" mt="2rem">
            <KeyboardArrowDownIcon color="primary" />
          </Box>
        </Box>
        <div className="text-center mt-4">
          Become a Employer{' '}
          <Link to="/employer">
            <span className="font-medium underline underline-offset-[0.05rem]">link</span>
          </Link>
        </div>

        {/*  

                <Autocomplete
                    label=" "
                    onBlur={handleBlur}
                    onChange={handleChange}
    
                    value={values.email}
                    name="email"
                    error={Boolean(touched.email) && Boolean(errors.email)}
                    helperText={touched.email && errors.email}
                    sx={{ gridColumn: "span 4" }}
                />
                <TextField
                    label="Password"
                    type="password"
                    onBlur={handleBlur}
                    onChange={handleChange}
                    value={values.password}
                    name="password"
                    error={Boolean(touched.password) && Boolean(errors.password)}
                    helperText={touched.password && errors.password}
                    sx={{ gridColumn: "span 4" }}
                /> */}
      </Box>
    </WidgetWrapper>
  );
};

export default FilterWidget;
