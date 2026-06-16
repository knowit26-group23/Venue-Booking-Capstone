import { useSelector } from "react-redux";
import { Navigate } from "react-router-dom";

export default function ProtectedRoute({children, role}){
    const loginstate = useSelector((state) => state.auth);

    //any user has logged in or not//
    if (!loginstate.isAuthenticated) {
       return <Navigate to="/login" />;
      }

      //check the role of the user//
      if (loginstate.user?.role !== role) {
       return <Navigate to="/unauthorized" />;
      }

     return children;
}