// To parse this JSON data, do
//
//     final categoryFeatured = categoryFeaturedFromJson(jsonString);

import 'dart:convert';

CategoryFeatured categoryFeaturedFromJson(String str) => CategoryFeatured.fromJson(json.decode(str));

String categoryFeaturedToJson(CategoryFeatured data) => json.encode(data.toJson());

class CategoryFeatured {
    int id;
    String title;
    dynamic description;
    DateTime publishedAt;
    DateTime updatedAt;
    bool curated;
    bool featured;
    int totalPhotos;
    bool private;
    String shareKey;
    List<Tag> tags;
    CategoryFeaturedLinks links;
    User user;
    CoverPhoto coverPhoto;
    List<PreviewPhoto> previewPhotos;

    CategoryFeatured({
        this.id,
        this.title,
        this.description,
        this.publishedAt,
        this.updatedAt,
        this.curated,
        this.featured,
        this.totalPhotos,
        this.private,
        this.shareKey,
        this.tags,
        this.links,
        this.user,
        this.coverPhoto,
        this.previewPhotos,
    });

    factory CategoryFeatured.fromJson(Map<String, dynamic> json) => new CategoryFeatured(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        publishedAt: DateTime.parse(json["published_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        curated: json["curated"],
        featured: json["featured"],
        totalPhotos: json["total_photos"],
        private: json["private"],
        shareKey: json["share_key"],
        tags: new List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        links: CategoryFeaturedLinks.fromJson(json["links"]),
        user: User.fromJson(json["user"]),
        coverPhoto: CoverPhoto.fromJson(json["cover_photo"]),
        previewPhotos: new List<PreviewPhoto>.from(json["preview_photos"].map((x) => PreviewPhoto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "published_at": publishedAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "curated": curated,
        "featured": featured,
        "total_photos": totalPhotos,
        "private": private,
        "share_key": shareKey,
        "tags": new List<dynamic>.from(tags.map((x) => x.toJson())),
        "links": links.toJson(),
        "user": user.toJson(),
        "cover_photo": coverPhoto.toJson(),
        "preview_photos": new List<dynamic>.from(previewPhotos.map((x) => x.toJson())),
    };
}

class CoverPhoto {
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int width;
    int height;
    String color;
    String description;
    String altDescription;
    Urls urls;
    CoverPhotoLinks links;
    List<dynamic> categories;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    User user;

    CoverPhoto({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.width,
        this.height,
        this.color,
        this.description,
        this.altDescription,
        this.urls,
        this.links,
        this.categories,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.user,
    });

    factory CoverPhoto.fromJson(Map<String, dynamic> json) => new CoverPhoto(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: CoverPhotoLinks.fromJson(json["links"]),
        categories: new List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: new List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "categories": new List<dynamic>.from(categories.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": new List<dynamic>.from(currentUserCollections.map((x) => x)),
        "user": user.toJson(),
    };
}

class CoverPhotoLinks {
    String self;
    String html;
    String download;
    String downloadLocation;

    CoverPhotoLinks({
        this.self,
        this.html,
        this.download,
        this.downloadLocation,
    });

    factory CoverPhotoLinks.fromJson(Map<String, dynamic> json) => new CoverPhotoLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Urls {
    String raw;
    String full;
    String regular;
    String small;
    String thumb;

    Urls({
        this.raw,
        this.full,
        this.regular,
        this.small,
        this.thumb,
    });

    factory Urls.fromJson(Map<String, dynamic> json) => new Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
    };
}

class User {
    String id;
    DateTime updatedAt;
    String username;
    String name;
    String firstName;
    String lastName;
    String twitterUsername;
    String portfolioUrl;
    String bio;
    String location;
    UserLinks links;
    ProfileImage profileImage;
    String instagramUsername;
    int totalCollections;
    int totalLikes;
    int totalPhotos;
    bool acceptedTos;

    User({
        this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.links,
        this.profileImage,
        this.instagramUsername,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.acceptedTos,
    });

    factory User.fromJson(Map<String, dynamic> json) => new User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"] == null ? null : json["twitter_username"],
        portfolioUrl: json["portfolio_url"] == null ? null : json["portfolio_url"],
        bio: json["bio"] == null ? null : json["bio"],
        location: json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername == null ? null : twitterUsername,
        "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
        "bio": bio == null ? null : bio,
        "location": location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
    };
}

class UserLinks {
    String self;
    String html;
    String photos;
    String likes;
    String portfolio;
    String following;
    String followers;

    UserLinks({
        this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers,
    });

    factory UserLinks.fromJson(Map<String, dynamic> json) => new UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    String small;
    String medium;
    String large;

    ProfileImage({
        this.small,
        this.medium,
        this.large,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => new ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class CategoryFeaturedLinks {
    String self;
    String html;
    String photos;
    String related;

    CategoryFeaturedLinks({
        this.self,
        this.html,
        this.photos,
        this.related,
    });

    factory CategoryFeaturedLinks.fromJson(Map<String, dynamic> json) => new CategoryFeaturedLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        related: json["related"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "related": related,
    };
}

class PreviewPhoto {
    String id;
    Urls urls;

    PreviewPhoto({
        this.id,
        this.urls,
    });

    factory PreviewPhoto.fromJson(Map<String, dynamic> json) => new PreviewPhoto(
        id: json["id"],
        urls: Urls.fromJson(json["urls"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "urls": urls.toJson(),
    };
}

class Tag {
    String title;

    Tag({
        this.title,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => new Tag(
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
    };
}
