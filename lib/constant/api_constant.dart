class ApiConstant{
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItems = "${baseUrl}home/?command=index";
  static const getArticleList = "${baseUrl}article/get.php?command=new&user_id=1";
  static const publishedByMe = "${baseUrl}article/get.php?command=published_by_me&user_id=";
   static const postRsgister ="${baseUrl}register/action.php";
  static const getArticlesWithTagId = "${baseUrl}article/get.php?command=get_articles_with_cat_id&cat_id=1&user_id=1";
  static const hostDlUrl =  "https://techblog.sasansafari.com";
  
}