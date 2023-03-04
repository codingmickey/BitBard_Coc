import React from 'react'
import {Box, Card, Typography} from '@mui/material'
import { TextField } from '@mui/material';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';

const form = () => {

  return (
    <Box sx={{maxWidth:'1400px', m:'auto'}}>
        <Box sx={{m:2}}>
            <Typography variant="h3">Create a New Trip</Typography>
        </Box>
        <Card sx={{width:'100%', p:2, display:'flex', flexDirection:'column'}}>
        <Box sx={{width:'100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
          <Box sx={{ width: '100%', mr: { md: 1 } }}>
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
                renderInput={(params) => <TextField {...params} sx={{width:'100%'}} />}
              />
            </LocalizationProvider>
          </Box>
          <Box sx={{ width: '100%', ml: { md: 1 } }}>
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
          <Box sx={{width:'100%', display: 'flex', flexDirection: { xs: 'column', md: 'row' }, mt: 2, mb: 2 }}>
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
                    sx={{width:'100%', mr: { md: 1 } }}
                />
            </Box>
          </Box>
          </Box>
        </Card>
    </Box>
  )
}

export default form
