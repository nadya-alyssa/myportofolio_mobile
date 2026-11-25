import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/models/project.dart';

void main() {
  test('Project.fromJson maps snake_case keys', () {
    final project = Project.fromJson({
      'id': 'abc-123',
      'title': 'My Project',
      'description': 'Desc',
      'tech_stack': 'Flutter, Django',
      'project_url': 'https://example.com',
    });

    expect(project.id, 'abc-123');
    expect(project.title, 'My Project');
    expect(project.techStack, 'Flutter, Django');
    expect(project.projectImageUrl, '');
  });

  test('Project.toJson uses snake_case and omits id', () {
    const project = Project(
      id: 'abc-123',
      title: 'My Project',
      description: 'Desc',
      techStack: 'Flutter',
      projectUrl: 'https://example.com',
    );

    final json = project.toJson();

    expect(json['tech_stack'], 'Flutter');
    expect(json['project_url'], 'https://example.com');
    expect(json.containsKey('id'), false);
  });
}
