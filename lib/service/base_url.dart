class ConfigClass {
 static String get baseUrl => "http://ec2-3-110-41-118.ap-south-1.compute.amazonaws.com:5001/api/";
}


Map<String, String> routes = {

 //USER APIS
 "fetchAllUsers": "user/fetchAllUsers",
 "createUser": "user/createusers",
 "signin": "user/signin",


 //SERVICES APIS
 "fetchAllServices": "service/fetchAllServices",

 //Banners APIS
 "fetchAllBanners": "banner/fetchAllBanners",
};
