import { Box, useMediaQuery, Button, Typography } from '@mui/material';
import WorldMap from 'components/UserMap';
import { useEffect, useState } from 'react';
import { useSelector } from 'react-redux';
import { Navigate, useParams } from 'react-router-dom';
import Navbar from 'scenes/navbar';
import Scheduler from 'scenes/Scheduler';
import FriendListWidget from 'scenes/widgets/FriendListWidget';
import MyPostWidget from 'scenes/widgets/MyPostWidget';
import PostsWidget from 'scenes/widgets/PostsWidget';
import UserWidget from 'scenes/widgets/UserWidget';
import Header from './header';
import UserImage from 'components/UserImage';
import { useTheme } from '@emotion/react';
import Cards from 'components/Cards';

const ProfilePage = () => {
  const [user, setUser] = useState(null);
  const { userId } = useParams();
  const token = useSelector((state) => state.token);
  const isNonMobileScreens = useMediaQuery('(min-width:1000px)');

  const { palette } = useTheme();

  const dark = palette.neutral.dark;
  const medium = palette.neutral.medium;
  const main = palette.neutral.main;

  const getUser = async () => {
    const response = await fetch(`http://localhost:3001/users/${userId}`, {
      method: 'GET',
      headers: { Authorization: `Bearer ${token}` }
    });
    console.log(response);
    const data = await response.json();
    setUser(data);
  };

  useEffect(() => {
    getUser();
  }, [userId]); // eslint-disable-line react-hooks/exhaustive-deps

  if (!user) return null;

  return (
    <Box>
      <Navbar />
      <Header />
      <Box
        width="100%"
        padding="2rem 6%"
        display={isNonMobileScreens ? 'flex' : 'block'}
        gap="2rem"
        margin="-6% 0 0 0"
        justifyContent="center"
      >
        <Box flexBasis={isNonMobileScreens ? '26%' : undefined}>
          <Box display="flex" justifyContent="center">
            <UserImage sx={{ marginBottom: '2rem' }} size="175px" image={user.picturePath} />
          </Box>
          <Box display="flex" mt="2rem" justifyContent="center">
            <Typography
              variant="h3"
              color={dark}
              fontWeight="500"
              sx={{
                '&:hover': {
                  color: palette.primary.light,
                  cursor: 'pointer'
                }
              }}
            >
              {user.firstName} {user.lastName}
            </Typography>
          </Box>
          <Box display="flex" mt="2rem" justifyContent="center">
            <Cards />
          </Box>
          <Box display="flex" mt="2rem" justifyContent="center">
            <Typography
              variant="h5"
              color={dark}
              fontWeight="500"
              sx={{
                '&:hover': {
                  color: palette.primary.light,
                  cursor: 'pointer'
                }
              }}
            >
              About
            </Typography>
          </Box>
          <Box display="flex" justifyContent="center">
            <Typography variant="p">I am a travelling person and I love to Travel..</Typography>
          </Box>
          <UserWidget userId={userId} picturePath={user.picturePath} />
          {/* <Box m="2rem 0" /> */}
          {/* <FriendListWidget userId={userId} /> */}
        </Box>
        <Box
          margin="6% 0 0 0"
          flexBasis={isNonMobileScreens ? '42%' : undefined}
          mt={isNonMobileScreens ? undefined : '2rem'}
        >
          <Typography variant="h4" fontWeight="bold" mb="1rem">
            Visited Countries
          </Typography>
          <WorldMap />
          <Box
            sx={{
              m: '2rem 0',
              width: '100%',
              display: 'flex',
              flexDirection: 'row',
              justifyContent: 'center',
              alignItems: 'center'
            }}
          >
            <Button
              variant="contained"
              sx={{ m: 'auto' }}
              onClick={() => (window.location.href = 'https://travelscheduler.netlify.app/')}
            >
              <Typography variant="h4">Update Your Schedule</Typography>
            </Button>
            {/* <Button variant="contained" sx={{m:'auto' }}>
              <Typography variant="h4">
              Update Your Schedule
              </Typography>
            </Button> */}
          </Box>
          {/* <MyPostWidget picturePath={user.picturePath} />
          <Box m="2rem 0" />
          {/* <PostsWidget userId={userId} isProfile /> */}
        </Box>
      </Box>
    </Box>
  );
};

export default ProfilePage;
