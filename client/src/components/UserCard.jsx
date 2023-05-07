import React from 'react';
import { makeStyles } from '@mui/styles';
import { Avatar, Card, CardHeader, CardContent, Button, IconButton, Box } from '@mui/material';
import { LocationOn } from '@mui/icons-material';
import { red } from '@mui/material/colors';
import profile from 'assets/profile.webp';

const useStyles = makeStyles((theme) => ({
  root: {
    maxWidth: 345
  },
  avatar: {
    backgroundColor: red[500]
  }
}));

const ProfileCard = ({ name, image, datesAvailable, sendMail }) => {
  const classes = useStyles();

  return (
    <Card
      className={classes.root}
      sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center' }}
    >
      <CardHeader
        avatar={
          <Avatar aria-label="profile" className={classes.avatar} sx={{ height: '200px', width: '200px' }}>
            <img src={`http://localhost:3001/assets/${image}`} alt="profile" width={200} height={200} />
          </Avatar>
        }
        sx={{ p: 1 }}
      />
      <CardContent sx={{ p: 0 }}>
        <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', flexDirection: 'column' }}>
          <h2>{name}</h2>
          <p>Solo Traveler</p>
        </Box>
        <div style={{ display: 'flex', alignItems: 'center', marginBottom: '1rem' }}>
          <LocationOn color="secondary" />
          <span style={{ marginLeft: '0.5rem' }}>New York, NY</span>
        </div>
        <Button variant="contained" onClick={sendMail} color="primary">
          Contact Me
        </Button>
        {/* <p>{datesAvailable}</p> */}
      </CardContent>
    </Card>
  );
};

export default ProfileCard;
