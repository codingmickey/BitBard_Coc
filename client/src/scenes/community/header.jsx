import React from 'react';
import { makeStyles } from '@mui/styles';
import { Box, Typography, useTheme } from '@mui/material';
import theme from '../../theme';
import community from '../../assets/community.avif';

const useStyles = makeStyles((theme) => ({
  banner: {
    backgroundColor: theme.palette.primary.main,
    color: theme.palette.common.white,
    padding: theme.spacing(4),
    textAlign: 'center',
  },
}));

const Header = () => {
  const theme = useTheme();
  const classes = useStyles();

  return (
    <Box>
    <Box sx={{
        backgroundImage: `url(${community})`,
        backgroundSize: 'cover',
        minHeight: '50vh',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    }}
    className={classes.banner}
    >
      <Typography variant="h1" component="h1" gutterBottom>
      Meet the Wander Match Community
      </Typography>
      <Typography variant="h4" component="p">
      Pick up some useful travel tips and great hosting advice from both workawayers and hosts. Get inspired by travel stories and more motivational reads shared by many others. Find out about what it means to be a part of the Workaway community.
      </Typography>
    </Box>
    {/* <Box sx={{
        backgroundColor: '#fff',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        margin: '0 auto',
        p:5,
    }}
    >
        <Box>
            <Typography variant="h3" component="p">
            Meet the Wander Match Community
            </Typography>
        </Box>
        <Box>
            <Typography variant="h6" component="p" sx={{maxWidth:"1400px", mt:2, textAlign:'center'}}>
            Pick up some useful travel tips and great hosting advice from both workawayers and hosts. Get inspired by travel stories and more motivational reads shared by many others. Find out about what it means to be a part of the Workaway community.


            </Typography>
        </Box>
    </Box> */}
    </Box>
  );
};

export default Header;