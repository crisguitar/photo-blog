$(function() {
  var postURLs,
  isFetchingPosts = false,
  shouldFetchPosts = true,
  postsToLoad = $(".catalogue").children().length,
  loadNewPostsThreshold = 100;

  $.getJSON('/all-posts.json', function(data) {
    postURLs = data["posts"];
    loadPostIfNearBottom();
    if (postURLs.length <= postsToLoad) {
      disableFetching();
    }
  });

  // If there's no spinner, it's not a page where posts should be fetched
  if ($(".infinite-spinner").length < 1)
  shouldFetchPosts = false;

  $(window).scroll(function(e){
    if (!shouldFetchPosts || isFetchingPosts) return;
    loadPostIfNearBottom();
  });

  function loadPostIfNearBottom() {
    var windowHeight = $(window).height(),
    windowScrollPosition = $(window).scrollTop(),
    bottomScrollPosition = windowHeight + windowScrollPosition,
    documentHeight = $(document).height();

    // If we've scrolled past the loadNewPostsThreshold, fetch posts
    if ((documentHeight - loadNewPostsThreshold) < bottomScrollPosition) {
      fetchPosts();
    }
  }

  // Fetch a chunk of posts
  function fetchPosts() {
    // Exit if postURLs haven't been loaded
    if (!postURLs) return;

    isFetchingPosts = true;

    // Load as many posts as there were present on the page when it loaded
    // After successfully loading a post, load the next one
    var loadedPosts = 0,
    postCount = $(".catalogue").children().length,
    callback = function() {
      loadedPosts++;
      var postIndex = postCount + loadedPosts;

      if (postIndex > postURLs.length-1) {
        disableFetching();
        return;
      }

      if (loadedPosts < postsToLoad) {
        fetchPostWithIndex(postIndex, callback);
      } else {
        isFetchingPosts = false;
      }
    };
    fetchPostWithIndex(postCount + loadedPosts, callback);
  }

  function fetchPostWithIndex(index, callback) {
    var postURL = postURLs[index];

    $.get(postURL, function(data) {
      $(data).hide().appendTo(".catalogue").fadeIn(1000);
      callback();
    });
  }

  function disableFetching() {
    shouldFetchPosts = false;
    isFetchingPosts = false;
    $(".infinite-spinner").fadeOut();
  }
});
