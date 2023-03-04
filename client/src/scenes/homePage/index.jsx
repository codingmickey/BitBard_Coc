import {
  GoogleMap,
  MarkerF,
  LoadScript,
  InfoWindow,
} from "@react-google-maps/api";
import { useState } from "react";
import { Box, Typography, useMediaQuery } from "@mui/material";
import { useSelector } from "react-redux";
import Navbar from "scenes/navbar";
import UserWidget from "scenes/widgets/UserWidget";
import MyPostWidget from "scenes/widgets/MyPostWidget";
import PostsWidget from "scenes/widgets/PostsWidget";
import AdvertWidget from "scenes/widgets/AdvertWidget";
import FriendListWidget from "scenes/widgets/FriendListWidget";

const HomePage = () => {
  const [locationData, setLocationData] = useState([
    {
      id: 1,
      name: "Valley of Flowers",
      image: "https://example.com/valley-of-flowers.jpg",
      position: { lat: 30.7279, lng: 79.6112},
      lat: 30.7279,
      lng: 79.6112,
      description:
        "The Valley of Flowers National Park is an Indian national park, located in North Chamoli and Pithoragarh, in the state of Uttarakhand and is known for its meadows of endemic alpine flowers and the variety of flora.",
    },
    {
      id: 2,
      name: "Hampi",
      image: "https://example.com/hampi.jpg",
      lat: 15.335,
      lng: 76.46,
      description:
        "Hampi is a UNESCO World Heritage Site located in east-central Karnataka, India. It became the centre of the Hindu Vijayanagara Empire capital in the 14th century.",
    },
    {
      id: 3,
      name: "Rann of Kutch",
      image: "https://example.com/rann-of-kutch.jpg",
      lat: 23.8,
      lng: 70.1,
      description:
        "The Rann of Kutch is a large salt marsh located in the Thar Desert in the Kutch District of Gujarat, India.",
    },
    {
      id: 4,
      name: "Jaisalmer",
      image: "https://example.com/jaisalmer.jpg",
      lat: 26.9124,
      lng: 70.9136,
      description:
        "Jaisalmer is a city located in the Indian state of Rajasthan, known for its golden fortress and numerous ornate Jain temples.",
    },
    { 
      id: 5,
      name: "Leh-Ladakh",
      image: "https://example.com/leh-ladakh.jpg",
      lat: 34.1526,
      lng: 77.5771,
      description:
        "Leh-Ladakh is a region in the northernmost part of India, known for its picturesque landscapes, rich culture and beautiful monasteries.",
    },
    {
      id: 6,
      name: "Majuli",
      image: "https://example.com/majuli.jpg",
      lat: 26.94,
      lng: 94.2167,
      description:
        "Majuli is a river island in the Brahmaputra River, Assam, India. It is the world's largest river island and is known for its unique culture and tradition.",
    },
    {
      id: 7,
      name: "Auroville",
      image: "https://example.com/auroville.jpg",
      lat: 12.0056,
      lng: 79.8097,
      description:
        "Auroville is an experimental township in the Indian state of Tamil Nadu, founded in 1968 by Mirra Alfassa and designed by architect Roger Anger.",
    },
    {
      id: 8,
      name: "Sunderbans",
      image: "https://example.com/sunderbans.jpg",
      lat: 21.9451,
      lng: 88.8895,
      description:
        "The Sunderbans is a vast mangrove forest located in the delta region of the Bay of Bengal, spread across India and Bangladesh. It is home to the Royal Bengal tiger, saltwater crocodile and a variety of bird species.",
    },
  ]);

  const [activeForum, setActiveForum] = useState("");
  const [showInfoWindow, setShowInfoWindow] = useState({
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false,
  });
  const [news_1, setNews_1] = useState([]);
  const [news_2, setNews_2] = useState([]);
  const [news_3, setNews_3] = useState([]);
  const [image, setImage] = useState([]);
  const [subscribed, setSubscribed] = useState(false);

  const myLatLng = { lat: -25.363, lng: 131.044 };

  const mapStyles = {
    height: "88vh",
    width: "90%",
  };

  const defaultCenter = {
    lat: 19.1078,
    lng: 72.8371,
  };

  const markerPosition = {
    lat: 18.9254,
    lng: 72.8249,
  };

  const handleMarkerClick = (id) => {
    setShowInfoWindow({ ...showInfoWindow, [id]: true });
    const locationName = locationData.find((location) => location.id === id);
    setActiveForum(locationName.name);
  };

  const handleInfoWindowClose = (id) => {
    setShowInfoWindow({...showInfoWindow, [id]:false})
  };


  const isNonMobileScreens = useMediaQuery("(min-width:1000px)");
  const { _id, picturePath } = useSelector((state) => state.user);

  return (
    <Box>
      <Navbar />
      <Box
        width="100%"
        padding="2rem 6%"
        display={isNonMobileScreens ? "flex" : "block"}
        gap="0.5rem"
        justifyContent="space-between"
      >
        <Box flexBasis={isNonMobileScreens ? "50%" : undefined}>
          <LoadScript googleMapsApiKey="AIzaSyBJW5dQc0jq1gajvy7MkH1JmxYRgHgCTk4">
            <GoogleMap
              mapContainerStyle={mapStyles}
              zoom={4}
              center={defaultCenter}
            >
              <MarkerF position={defaultCenter} />
              {locationData.map(
                (location) => (
                  (
                    <MarkerF
                      key={location.id}
                      position={{lat: location.lat, lng: location.lng}}
                      onClick={()=>handleMarkerClick(location.id)}
                    >
                      {showInfoWindow[location.id] && (
                        <InfoWindow onCloseClick={()=>handleInfoWindowClose(location.id)}>
                          <div>
                            <Typography variant="h3" style={{ color: "#000" }}>
                                {location.name}
                            </Typography>
                            <Typography variant="h7" style={{ color: "#000", fontWeight:100}}>
                              {location.description.slice(0, 50)}...
                            </Typography>
                          </div>
                        </InfoWindow>
                      )}
                    </MarkerF>
                  )
                )
              )}
            </GoogleMap>
          </LoadScript>
        </Box>
        <Box
          flexBasis={isNonMobileScreens ? "50%" : undefined}
          mt={isNonMobileScreens ? undefined : "2rem"}
        >
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
