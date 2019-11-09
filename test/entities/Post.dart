import 'package:DemoFlutter/domain/entities/Post.dart';
import 'package:test_api/test_api.dart';

void main() {
  Comment comment = new Comment(100, "@david", "www.img.com", "amazing");
  List<Comment> list = new List();
  list.add(comment);

  Post post = new Post(1, 2001, "nazesum", "www.img.com", "description", "www.img.com", 12, list);

  test("Testing Post Entity ID", () {
    expect(post.getId, 1);
  });

  test("Testing Post entity UserID ", () {
    expect(post.getUserId, 2001);
  });

  test("Testing Post entity Username ", () {
    expect(post.getUserName, "nazesum");
  });

  test("Testing Post entity Image", () {
    expect(post.getImage, "www.img.com");
  });

  test("Testing Post entity Description", () {
    expect(post.getBody, "description");
  });

  test("Testing Post entity ImagePost", () {
    expect(post.getUserImage, "www.img.com");
  });

  test("Testing Post entity Likes",() {
    expect(post.getLikes, 12);
  });
  
  test("Testing Post entity ListComments", () {
    expect(post.getComments, list);
    expect(post.getComments.length, list.length);
    expect(post.getComments[0], list[0]);
    expect(post.getComments[0].getUsername, list[0].getUsername);
    expect(post.getComments[0].getUserId, list[0].getUserId);
    expect(post.getComments[0].getUserImage, list[0].getUserImage);
    expect(post.getComments[0].getComment, list[0].getComment);
  });

}
