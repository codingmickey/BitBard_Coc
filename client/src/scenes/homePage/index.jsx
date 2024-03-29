import { GoogleMap, MarkerF, LoadScript, InfoWindow } from '@react-google-maps/api';
import axios from 'axios';
import { useState, useEffect } from 'react';
import { Box, Typography, useMediaQuery } from '@mui/material';
import { useSelector } from 'react-redux';
import Navbar from 'scenes/navbar';
import UserWidget from 'scenes/widgets/UserWidget';
import MyPostWidget from 'scenes/widgets/MyPostWidget';
import PostsWidget from 'scenes/widgets/PostsWidget';
import AdvertWidget from 'scenes/widgets/AdvertWidget';
import FriendListWidget from 'scenes/widgets/FriendListWidget';

const HomePage = () => {
  const [locationData, setLocationData] = useState([
    {
      id: 1,
      name: 'Valley of Flowers',
      image: 'https://upload.wikimedia.org/wikipedia/commons/6/65/Gopeshwar_Chamoli.jpg',
      position: { lat: 30.7279, lng: 79.6112 },
      lat: 30.7279,
      lng: 79.6112,
      city: 'Chamoli',
      state: 'Uttarakhand',
      description:
        'The Valley of Flowers National Park is an Indian national park, located in North Chamoli and Pithoragarh, in the state of Uttarakhand and is known for its meadows of endemic alpine flowers and the variety of flora.'
    },
    {
      id: 2,
      name: 'Hampi',
      image: 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Hampi_virupaksha_temple.jpg',
      lat: 15.335,
      lng: 76.46,
      city: 'Hampi',
      state: 'Karnataka',
      description:
        'Hampi is a UNESCO World Heritage Site located in east-central Karnataka, India. It became the centre of the Hindu Vijayanagara Empire capital in the 14th century.'
    },
    {
      id: 3,
      name: 'Rann of Kutch',
      image:
        'https://www.tripsavvy.com/thmb/Yh7C0nh6CKbB5BmhRz3il-V8sm8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-537000923-541774dbe2d44759815fdf0719b04685.jpg',
      lat: 23.8,
      lng: 70.1,
      city: 'Bhuj',
      state: 'Gujarat',
      description:
        'The Rann of Kutch is a large salt marsh located in the Thar Desert in the Kutch District of Gujarat, India.'
    },
    {
      id: 4,
      name: 'Jaisalmer',
      image: 'https://upload.wikimedia.org/wikipedia/commons/9/91/Jaisalmer-Fort-04-von_Gadsisar_Lake-2018-gje.jpg',
      lat: 26.9124,
      lng: 70.9136,
      city: 'Jaisalmer',
      state: 'Rajasthan',
      description:
        'Jaisalmer is a city located in the Indian state of Rajasthan, known for its golden fortress and numerous ornate Jain temples.'
    },
    {
      id: 5,
      name: 'Leh-Ladakh',
      image: 'https://static.toiimg.com/photo/91796659/leh.jpg?width=748&resize=4',
      lat: 34.1526,
      lng: 77.5771,
      city: 'Leh',
      state: 'Jammu and Kashmir',
      description:
        'Leh-Ladakh is a region in the northernmost part of India, known for its picturesque landscapes, rich culture and beautiful monasteries.'
    },
    {
      id: 6,
      name: 'Majuli',
      image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Doriya_River_of_Majuli.jpg/1200px-Doriya_River_of_Majuli.jpg',
      lat: 26.94,
      lng: 94.2167,
      city: 'Majuli',
      state: 'Assam',
      description:
        "Majuli is a river island in the Brahmaputra River, Assam, India. It is the world's largest river island and is known for its unique culture and tradition."
    },
    {
      id: 7,
      name: 'Auroville',
      image: 'https://upload.wikimedia.org/wikipedia/commons/c/c2/Auroville.JPG',
      lat: 12.0056,
      lng: 79.8097,
      city: 'Auroville',
      state: 'Tamil Nadu',
      description:
        'Auroville is an experimental township in the Indian state of Tamil Nadu, founded in 1968 by Mirra Alfassa and designed by architect Roger Anger.'
    }
  ]);

  const [forumData, setForumData] = useState([]);

  const [activeForum, setActiveForum] = useState('');
  const [showInfoWindow, setShowInfoWindow] = useState({
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false,
    9: false,
    10: false,
    11: false,
    12: false
  });
  const [news_1, setNews_1] = useState([]);
  const [news_2, setNews_2] = useState([]);
  const [news_3, setNews_3] = useState([]);
  const [image, setImage] = useState([]);
  const [subscribed, setSubscribed] = useState(false);

  const getPosts = async () => {
    const { data } = await axios.get(`http://localhost:3001/posts/location/${activeForum}`);
    setForumData(data);
    // console.log(forumData.data)
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
  }, [activeForum]);

  const myLatLng = { lat: -25.363, lng: 131.044 };

  const mapStyles = {
    height: '88vh',
    width: '90%'
  };

  const [defaultCenter, setDeafultCenter] = useState({
    lat: 19.1078,
    lng: 72.8371
  });

  const markerPosition = {
    lat: 18.9254,
    lng: 72.8249
  };

  // const mapOptions = [
  //   {
  //     featureType: 'all',
  //     elementType: 'labels.text',
  //     stylers: [
  //       {
  //         color: '#878787'
  //       }
  //     ]
  //   },
  //   {
  //     featureType: 'road.highway',
  //     elementType: 'all',
  //     stylers: [
  //       {
  //         color: '#f5f5f5'
  //       }
  //     ]
  //   },
  //   {
  //     featureType: 'road.highway',
  //     elementType: 'geometry.stroke',
  //     stylers: [
  //       {
  //         color: '#c9c9c9'
  //       }
  //     ]
  //   },
  //   {
  //     featureType: 'water',
  //     elementType: 'all',
  //     stylers: [
  //       {
  //         color: '#aee0f4'
  //       }
  //     ]
  //   }
  // ];

  const handleMarkerClick = (id) => {
    if (activeForum !== '') {
      const locationName = locationData.find((location) => location.id === id);
      // setActiveForum(locationName.name);
      console.log(locationName.id);
      setShowInfoWindow({ ...showInfoWindow, [id]: false });
    }
    setShowInfoWindow({ ...showInfoWindow, [id]: true });
    const locationName = locationData.find((location) => location.id === id);
    setActiveForum(locationName.name);

    setDeafultCenter({ lat: locationName.lat, lng: locationName.lng });
  };

  const handleInfoWindowClose = (id) => {
    setShowInfoWindow({ ...showInfoWindow, [id]: false });
    setActiveForum('');
    setDeafultCenter({ lat: 19.1078, lng: 72.8371 });
  };

  const isNonMobileScreens = useMediaQuery('(min-width:1000px)');
  const { _id, picturePath } = useSelector((state) => state.user);

  return (
    <Box>
      <Navbar />
      <Box
        width="100%"
        padding="2rem 6% 2rem 0"
        display={isNonMobileScreens ? 'flex' : 'block'}
        gap="0.5rem"
        justifyContent="space-evenly"
      >
        <Box flexBasis={isNonMobileScreens ? '55%' : undefined}>
          <LoadScript googleMapsApiKey="AIzaSyBJW5dQc0jq1gajvy7MkH1JmxYRgHgCTk4">
            <GoogleMap mapContainerStyle={mapStyles} zoom={4} center={defaultCenter}>
              <MarkerF position={defaultCenter} />
              {locationData.map((location) => (
                <MarkerF
                  key={location.id}
                  position={{ lat: location.lat, lng: location.lng }}
                  onClick={() => handleMarkerClick(location.id)}
                  // onClickableChanged={() => handleMarkerClick(location.id)}
                >
                  {showInfoWindow[location.id] === true && (
                    <InfoWindow onCloseClick={() => handleInfoWindowClose(location.id)}>
                      <div>
                        <img src={location.image} alt={location.name} style={{ width: '100%' }} />
                        <Typography variant="h3" style={{ color: '#000' }}>
                          {location.name}
                        </Typography>
                        <Typography variant="h7" style={{ color: '#000', fontWeight: 100 }}>
                          {location.description.slice(0, 50)}...
                        </Typography>
                      </div>
                    </InfoWindow>
                  )}
                </MarkerF>
              ))}
            </GoogleMap>
          </LoadScript>
        </Box>
        <Box flexBasis={isNonMobileScreens ? '40%' : undefined} mt={isNonMobileScreens ? undefined : '2rem'}>
          <MyPostWidget picturePath={picturePath} />
          <PostsWidget userId={_id} activeForum={activeForum} />
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

export default HomePage;
