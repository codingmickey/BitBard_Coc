import { BrowserRouter, Navigate, Routes, Route } from 'react-router-dom';
import HomePage from 'scenes/homePage';
import LoginPage from 'scenes/loginPage';
import ProfilePage from 'scenes/profilePage';
import { useMemo } from 'react';
import { useSelector } from 'react-redux';
import { CssBaseline, ThemeProvider } from '@mui/material';
import { createTheme } from '@mui/material/styles';
import { themeSettings } from './theme';
import TravelPage from 'scenes/TravelPage.jsx';
import NotFound from 'components/NotFound';
import LandingPage from 'scenes/LandingPage';
import Explore from 'scenes/explore';
import NewTrip from 'scenes/newtrip';
import Shorts from 'scenes/shorts';
import ChatGPT from 'scenes/ChatGPT';
import { Chat } from 'scenes/Chat';
import MeetUp from 'scenes/meetUp';
import Safety from 'scenes/safety';
import Community from 'scenes/community';
import WorldMap from 'components/UserMap';
import JoinRoom, { Video } from 'scenes/video/videoCall';

function App() {
  const mode = useSelector((state) => state.mode);
  const theme = useMemo(() => createTheme(themeSettings(mode)), [mode]);
  const isAuth = Boolean(useSelector((state) => state.token));

  return (
    <div className="app">
      <BrowserRouter>
        <ThemeProvider theme={theme}>
          <CssBaseline />
          <Routes>
            <Route path="/" element={<LoginPage />} />
            <Route path="/hero" element={<LandingPage />} />
            <Route path="/home" element={isAuth ? <HomePage /> : <Navigate to="/" />} />
            <Route path="/profile/:userId" element={<ProfilePage />} />
            <Route path="/trips" element={<TravelPage />} />
            <Route path="/chatgpt" element={<Chat />} />
            <Route path="/chat" element={<Chat />} />
            <Route path="*" element={<NotFound />} />
            <Route path="/explore" element={<Shorts />} />
            <Route path="/newtrip" element={<NewTrip />} />
            <Route path="/shorts" element={<Explore />} />
            <Route path="/meetup" element={<MeetUp />} />
            <Route path="/safety" element={<Safety />} />
            <Route path="/community" element={<Community />} />
            <Route path="/maps" element={<WorldMap />} />
            <Route path="/video-chat" element={<JoinRoom />} />
            <Route path="/video/:id" element={<Video />} />
          </Routes>
        </ThemeProvider>
      </BrowserRouter>
    </div>
  );
}

export default App;
