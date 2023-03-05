import React from 'react';
import { makeStyles } from '@mui/styles';
import { 
  Avatar, 
  Card, 
  CardHeader, 
  CardContent, 
  Button,
  IconButton,
  Box
} from '@mui/material';
import { LocationOn } from '@mui/icons-material';
import { red } from '@mui/material/colors';
import profile from 'assets/profile.webp'

const useStyles = makeStyles((theme) => ({
  root: {
    maxWidth: 345,
  },
  avatar: {
    backgroundColor: red[500],
  },
}));

const ProfileCard = () => {
  const classes = useStyles();

  return (
    <Card className={classes.root} sx={{display:'flex', flexDirection:'column', alignItems:'center', justifyContent:'center'}}>
      <CardHeader
        avatar={
          <Avatar aria-label="profile" className={classes.avatar} sx={{height:'200px', width:'200px'}}>
            <img src={profile} alt="profile" width={100} height={200} />
            <img src={profile} alt="profile" width={100} height={200} />
          </Avatar>
        }
      />
      <CardContent>
        <Box sx={{display: 'flex', alignItems: 'center', justifyContent: 'center', flexDirection: 'column'}}>
            <h2>John & Kim</h2>
            <p>Couple</p>
        </Box>
        <div style={{display: 'flex', alignItems: 'center', marginBottom: '1rem'}}>
          <LocationOn color="secondary" />
          <span style={{marginLeft: '0.5rem'}}>New York, NY</span>
        </div>
        <Button variant="contained" color="primary">
          Contact Us
        </Button>
      </CardContent>
    </Card>
  );
};

export default ProfileCard;
