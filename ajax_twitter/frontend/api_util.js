const APIUtil = {
  unfollowUser: (id,cb) => {
    $.ajax({
      method: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "JSON",
      success: () => {
        cb();
      },
      error: (error) => console.log(error)
    });
  },

  followUser: (id,cb) => {
    $.ajax({
      method: "POST",
      url: `/users/${id}/follow`,
      dataType: "JSON",
      success: () => {
        cb();
      },
      error: (error) => console.log(error)
    });
  }
};

module.exports = APIUtil;
