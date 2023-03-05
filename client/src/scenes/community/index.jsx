import React from 'react';
import { Box, Typography, useTheme, useMediaQuery, Grid, Button } from '@mui/material';
import Navbar from '../navbar';
import Header from './header';
import Filters from '../widgets/meetFilter';
import UserCard from '../../components/UserCard';
import { useSelector } from 'react-redux';

const MeetUp = () => {
  const isNonMobileScreens = useMediaQuery('(min-width:1000px)');
  const { _id, picturePath } = useSelector((state) => state.user);

  const communityData = [
    {
      id: 1,
      image: 'https://www.workaway.info/gfx/2015/content/teaser_blog.jpg',
      title: 'Wander Match Blog',
      description: 'Stay tuned with our most recent travel tips, news and advice to plan your own journey.',
      sub: 'Read more'
    },
    {
      id: 2,
      image: 'Stay tuned with our most recent travel tips, news and advice to plan your own journey.',
      title: 'Wander Match Photo Gallery',
      description: 'Explore the world through the lens of our community of workawayers and hosts.',
      sub: 'Explore Full Gallery'
    },
    {
      id: 3,
      image: 'https://www.workaway.info/gfx/2015/content/teaser_workawaytv.jpg',
      title: 'Wander Match TV',
      description:
        'Check out our travel vlogs and videos showcasing various Workaway experiences and stories.Stay tuned with our most recent travel tips, news and advice to plan your own journey.',
      sub: 'Watch Now'
    },
    {
      id: 4,
      image: 'https://www.workaway.info/gfx/2015/content/teaser_ambassadors.jpg',
      title: 'Wander Match Ambassadors',
      description: 'Meet our community of travel ambassadors and learn more about their experiences and adventures.',
      sub: 'Get Involved'
    },
    {
      id: 5,
      image: 'https://www.workaway.info/en/community/media',
      title: 'Logos and Poster',
      description: 'Want to help spread the Workaway word? Feel free to use our resources here.',
      sub: 'Browse Here'
    },
    {
      id: 6,
      image: 'https://www.workaway.info/gfx/2015/content/teaser_workaway-as-a-gift.jpg',
      title: 'Gift',
      description: 'Give the gift of travel and help someone discover the world through Workaway.',
      sub: 'Buy Gift Membership'
    }
  ];

  return (
    <Box sx={{ width: '100%' }}>
      <Navbar />
      <Header />
      <Box sx={{ width: '100%' }}>
        
      <Grid container spacing={5}>
        {communityData.map((item) => (
            <Grid item spacing={3} xs={12} sm={6} md={4}>
              <Box sx={{display:'flex', flexDirection:'column', }}>
                <img src={item.image} alt="" height={250} width={250} />
                <Typography variant="h6">{item.title}</Typography>
                <Typography variant="body2">{item.description}</Typography>
                <Button variant="contained">{item.sub}</Button>
              </Box>
            </Grid>
        
        ))}
        </Grid>
      </Box>
    </Box>
  );
};

export default MeetUp;
