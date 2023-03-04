import { Box, Grid, useMediaQuery } from '@mui/material';
import { useSelector } from 'react-redux';
import Navbar1 from './navbar/index';
import Filters from './widgets/FilterWidget2';
import TripCard from '../components/TripCard';

const JobsPage = () => {
  const isNonMobileScreens = useMediaQuery('(min-width:1000px)');
  const { _id, picturePath } = useSelector((state) => state.user);

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
            {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((item) => (
              <Grid item xs={12} sm={6} md={4}>
                <TripCard />
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
