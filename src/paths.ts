const paths = {
  home() {
    return "/";
  },
  topicShow(topicSlug: string) {
    return `/topics/${topicSlug}`;
  },
  postSlug(topicSlug: string) {
    return `/topics/${topicSlug}/posts/new`;
  },
  postsShow(topicSlug: string) {
    return `/topics/${topicSlug}/posts`;
  },
};

export default paths;
