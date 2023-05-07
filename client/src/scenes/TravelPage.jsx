import { Box, Grid, useMediaQuery } from '@mui/material';
import { useSelector } from 'react-redux';
import Navbar1 from './navbar/index';
import Filters from './widgets/FilterWidget2';
import TripCard from '../components/TripCard';
import { useEffect, useState } from 'react';
import axios from 'axios';

const JobsPage = () => {
  const isNonMobileScreens = useMediaQuery('(min-width:1000px)');
  const { _id, picturePath } = useSelector((state) => state.user);

  const [users, setUsers] = useState([]);

  const getPosts = async () => {
    const { data } = await axios.get(`http://localhost:3001/host`);
    setUsers(data);
    console.log(data);
  };

  useEffect(() => {
    // if (isProfile) {
    //   getUserPosts();
    // } else {
    //   getPosts();
    // }
    getPosts();
    // if(isProfile){
    //   getUserPosts();
    // }
  }, []);

  return (
    <Box>
      <Navbar1 />
      <Box
        width="100%"
        padding="2rem 6%"
        display={isNonMobileScreens ? 'flex' : 'block'}
        gap="0.5rem"
        justifyContent="center"
      >
        <Box flexBasis={isNonMobileScreens ? '26%' : undefined}>
          <Filters userId={_id} picturePath={picturePath} />
        </Box>
        <Box flexBasis={isNonMobileScreens ? '60%' : undefined} mt={isNonMobileScreens ? undefined : '2rem'}>
          {/* <MyPostWidget picturePath={picturePath} /> */}
          {/* <JobPostsWidget userId={_id} /> */}
          <Grid container spacing={4}>
            {users.map((item) => (
              <Grid item xs={12} sm={6} md={4}>
                <TripCard
                  image={item.image}
                  title={item.title}
                  desc={item.desc}
                  location={item.itineraryRoute}
                  price={item.itineraryPrice}
                  dates={item.itineraryDates}
                  pref={item.itineraryPreferences}
                />
              </Grid>
            ))}
          </Grid>
        </Box>
        {/* {isNonMobileScreens && (
          <Box flexBasis="26%">
            <AdvertWidget />
            <Box m="2rem 0" />
            <FriendListWidget userId={_id} />
          </Box>
        )} */}
      </Box>
    </Box>
  );
};

export default JobsPage;
