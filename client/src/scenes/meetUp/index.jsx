import React from 'react';
import { Box, Typography, useTheme, useMediaQuery, Grid } from "@mui/material";
import Navbar from "../navbar";
import Header from "./header";
import Filters from '../widgets/meetFilter';
import UserCard from '../../components/UserCard';
import { useSelector } from 'react-redux';

const MeetUp = () => {
  
  const isNonMobileScreens = useMediaQuery('(min-width:1000px)');
  const { _id, picturePath } = useSelector((state) => state.user);

  return (
    <Box>
        <Navbar />
        <Header />
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
            {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((item) => (
              <Grid item xs={12} sm={6} md={4}>
                <UserCard />
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
  )
}

export default MeetUp;
