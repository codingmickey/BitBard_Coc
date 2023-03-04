import React, { useState } from 'react';
import {
  Box,
  Card,
  Typography,
  Checkbox,
  FormControl,
  FormGroup,
  FormControlLabel,
  FormLabel,
  useTheme,
  Button,
  InputLabel,
  Select,
    MenuItem,
} from '@mui/material';
import { TextField } from '@mui/material';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import Dropzone from 'react-dropzone';
import EditOutlinedIcon from '@mui/icons-material/EditOutlined';
import FlexBetween from 'components/FlexBetween';

const Form = () => {
  const categories = [
    "Hiking",
    "Camping",
    "Biking",
    "Skiing",
    "Snowboarding",
    "Kayaking",
    "Surfing",
  ]

  const types = [
    "Guided",
    "Coworking"
  ]

  const [category, setCategory] = useState(null);
    const [type, setType] = useState(null);

    const handleCategoryChange = (event) => {
        setCategory(event.target.value);
    };

    const handleTripTypeChange = (event) => {
        setType(event.target.value);    
    };

  const { palette } = useTheme();
  const [fieldValue, setFieldValue] = useState(null);
  const [state, setState] = useState({
    a: true,
    b: false,
    c: false
  });

  const handleChange = (event) => {
    setState({
      ...state,
      [event.target.name]: event.target.checked
    });
  };

  const { a, b, c } = state;
  return (
    <Box sx={{ maxWidth: '1000px', m: 'auto' }}>
      <Box sx={{ m: 2 }}>
        <Typography variant="h3">Create a New Trip</Typography>
      </Box>
      <Card sx={{ width: '100%', p: 2, display: 'flex', flexDirection: 'column' }}>
        <Box sx={{ width: '100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
          <Box sx={{ width: '100%', mr: { md: 1 }, display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
            <Typography variant="h5" sx={{ mr: 3 }}>
              Trip Start Date
            </Typography>
            <LocalizationProvider dateAdapter={AdapterDayjs} sx={{ maxWidth: '100%', width: '100%' }}>
              <DatePicker
                fullWidth
                label="Start Date"
                openTo="year"
                views={['year', 'month', 'day']}
                // value={}
                // onChange={(newValue) => {
                //   setEnquiry({
                //     ...enquiry,
                //     targetDate: newValue,
                //   });
                // }}
                renderInput={(params) => <TextField {...params} sx={{ width: '100%' }} />}
              />
            </LocalizationProvider>
          </Box>
          <Box sx={{ width: '100%', ml: { md: 1 }, display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
            <Typography variant="h5" sx={{ mr: 3 }}>
              Trip End Date
            </Typography>
            <LocalizationProvider dateAdapter={AdapterDayjs} sx={{ maxWidth: '100%', width: '100%' }}>
              <DatePicker
                fullWidth
                label="End Date"
                openTo="year"
                views={['year', 'month', 'day']}
                // value={}
                // onChange={(newValue) => {
                //   setEnquiry({
                //     ...enquiry,
                //     targetDate: newValue,
                //   });
                // }}
                renderInput={(params) => <TextField {...params} fullWidth />}
              />
            </LocalizationProvider>
          </Box>
        </Box>
        <Box sx={{ width: '100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
        <FormControl fullWidth sx={{ mr: { md: 1 } }}>
            <InputLabel id="demo-simple-select-label">Categories</InputLabel>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={category}
              label="Status"
              onChange={handleCategoryChange}
            >
              {categories.map((category) => (
                <MenuItem value={category}>{category}</MenuItem>
              ))}
            </Select>
          </FormControl>
          <FormControl fullWidth sx={{ ml: { md: 1 }, mt: { xs: 2, md: 0 } }}>
            <InputLabel id="demo-simple-select-label">Type of Trip</InputLabel>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={type}
              label="Carcass"
              onChange={handleTripTypeChange}
            >
              {types.map((type) => (
                <MenuItem value={type}>{type}</MenuItem>
              ))}
            </Select>
          </FormControl>
        </Box>
        <Box sx={{ width: '100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
          <Box sx={{ width: '100%', mr: { md: 1 } }}>
            <TextField
              fullWidth
              label="Trip Name"
              // value={}
              // onChange={(e) => {
              //   setEnquiry({
              //     ...enquiry,
              //     name: e.target.value,
              //   });
              // }}
              sx={{ width: '100%', mr: { md: 1 } }}
            />
          </Box>
        </Box>
        <Box sx={{ width: '100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
          <Box sx={{ width: '100%', mr: { md: 1 } }}>
            <TextField
              fullWidth
              multiline
              rows={4}
              label="Trip Description"
              // value={}
              // onChange={(e) => {
              //   setEnquiry({
              //     ...enquiry,
              //     name: e.target.value,
              //   });
              // }}
              sx={{ width: '100%', mr: { md: 1 } }}
            />
          </Box>
        </Box>
        <Box sx={{ width: '100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
          <FormControl sx={{}} component="fieldset">
            <FormLabel component="legend">
              <Typography variant="h5">Choose the type of accomodation</Typography>
            </FormLabel>
            <FormGroup>
              <FormControlLabel control={<Checkbox checked={a} onChange={handleChange} name="a" />} label="Hotel" />
              <FormControlLabel control={<Checkbox checked={b} onChange={handleChange} name="b" />} label="Camping" />
              <FormControlLabel
                control={<Checkbox checked={c} onChange={handleChange} name="c" />}
                label="Bed & Breakfast"
              />
            </FormGroup>
          </FormControl>
        </Box>
        <Box sx={{ width: '100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
          <Dropzone
            acceptedFiles=".jpg,.jpeg,.png"
            multiple={true}
            onDrop={(acceptedFiles) => setFieldValue('picture', acceptedFiles[0])}
          >
            {({ getRootProps, getInputProps }) => (
              <Box
                {...getRootProps()}
                border={`2px dashed ${palette.primary.main}`}
                p="1rem"
                sx={{ '&:hover': { cursor: 'pointer' }, width: '100%' }}
              >
                <input {...getInputProps()} />
                {!fieldValue ? (
                  <p>Add Pictures Here</p>
                ) : (
                  <FlexBetween>
                    <Typography>{fieldValue.picture.name}</Typography>
                    <EditOutlinedIcon />
                  </FlexBetween>
                )}
              </Box>
            )}
          </Dropzone>
        </Box>
        <Box sx={{ width: '100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
            <TextField
              fullWidth
              label="Minimum Number of People"
              // value={}
              // onChange={(e) => {
              //   setEnquiry({
              //     ...enquiry,
              //     name: e.target.value,
              //   });
              // }}
              sx={{ width: '100%', mr: { md: 1 } }}
            />
            <TextField
              fullWidth
              label="Maximum Number of People"
              // value={}
              // onChange={(e) => {
              //   setEnquiry({
              //     ...enquiry,
              //     name: e.target.value,
              //   });
              // }}
              sx={{ width: '100%', ml: { md: 1 } }}
            />
        </Box>
        <Box sx={{ width: '100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
            <Button variant="contained" sx={{ width: '100%', maxWidth:'200px' }}>
                Create Trip
            </Button>
        </Box>
      </Card>
    </Box>
  );
};

export default Form;
