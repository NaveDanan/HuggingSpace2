# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class DatasetTags(models.Model):
    id = models.UUIDField(primary_key=True)
    dataset = models.ForeignKey('Datasets', models.DO_NOTHING, blank=True, null=True)
    tag = models.TextField()

    class Meta:
        managed = False
        db_table = 'dataset_tags'
        unique_together = (('dataset', 'tag'),)


class Datasets(models.Model):
    id = models.UUIDField(primary_key=True)
    title = models.TextField()
    description = models.TextField()
    author = models.ForeignKey('Profiles', models.DO_NOTHING)
    thumbnail_url = models.TextField()
    type = models.TextField()
    format = models.TextField()
    size = models.TextField()
    likes_count = models.IntegerField(blank=True, null=True)
    forks_count = models.IntegerField(blank=True, null=True)
    views_count = models.IntegerField(blank=True, null=True)
    is_featured = models.BooleanField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    is_private = models.BooleanField(blank=True, null=True)
    is_owner = models.BooleanField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'datasets'


class DjangoContentType(models.Model):
    name = models.CharField(max_length=100)
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class ModelCommits(models.Model):
    id = models.UUIDField(primary_key=True)
    model = models.ForeignKey('Models', models.DO_NOTHING)
    author = models.ForeignKey('Profiles', models.DO_NOTHING)
    message = models.TextField()
    created_at = models.DateTimeField(blank=True, null=True)
    files = models.TextField()  # This field type is a guess.
    hash = models.TextField()

    class Meta:
        managed = False
        db_table = 'model_commits'


class ModelFileChanges(models.Model):
    id = models.UUIDField(primary_key=True)
    commit = models.ForeignKey(ModelCommits, models.DO_NOTHING)
    file_path = models.TextField()
    change_type = models.TextField()
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'model_file_changes'


class ModelTags(models.Model):
    id = models.UUIDField(primary_key=True)
    model = models.ForeignKey('Models', models.DO_NOTHING, blank=True, null=True)
    tag = models.TextField()

    class Meta:
        managed = False
        db_table = 'model_tags'
        unique_together = (('model', 'tag'),)


class Models(models.Model):
    id = models.UUIDField(primary_key=True)
    created_at = models.DateTimeField(blank=True, null=True)
    title = models.TextField()
    description = models.TextField()
    author = models.ForeignKey('Profiles', models.DO_NOTHING)
    thumbnail_url = models.TextField()
    framework = models.TextField()
    likes_count = models.IntegerField(blank=True, null=True)
    forks_count = models.IntegerField(blank=True, null=True)
    views_count = models.IntegerField(blank=True, null=True)
    is_featured = models.BooleanField(blank=True, null=True)
    is_private = models.BooleanField(blank=True, null=True)
    type = models.TextField()
    is_owner = models.BooleanField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'models'
        unique_together = (('title', 'author'),)


class Profiles(models.Model):
    id = models.UUIDField(primary_key=True)
    created_at = models.DateTimeField(blank=True, null=True)
    username = models.TextField(unique=True)
    display_name = models.TextField(blank=True, null=True)
    avatar_url = models.TextField(blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    github_url = models.TextField(blank=True, null=True)
    website_url = models.TextField(blank=True, null=True)
    theme_preference = models.TextField(blank=True, null=True)
    github_id = models.TextField(unique=True, blank=True, null=True)
    github_access_token = models.TextField(blank=True, null=True)
    github_username = models.TextField(blank=True, null=True)
    organizations = models.JSONField(blank=True, null=True)
    interests = models.TextField(blank=True, null=True)  # This field type is a guess.
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'profiles'


class Repo(models.Model):
    id = models.UUIDField(primary_key=True)
    storage_id = models.TextField()
    type = models.TextField()  # This field type is a guess.
    owner_name = models.TextField()
    owner_id = models.UUIDField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    full_path = models.TextField()
    is_folder = models.BooleanField()

    class Meta:
        managed = False
        db_table = 'repo'
        unique_together = (('owner_id', 'full_path'),)


class SpaceTags(models.Model):
    id = models.UUIDField(primary_key=True)
    space = models.ForeignKey('Spaces', models.DO_NOTHING, blank=True, null=True)
    tag = models.TextField()

    class Meta:
        managed = False
        db_table = 'space_tags'
        unique_together = (('space', 'tag'),)


class Spaces(models.Model):
    id = models.UUIDField(primary_key=True)
    created_at = models.DateTimeField(blank=True, null=True)
    title = models.TextField()
    description = models.TextField()
    author = models.ForeignKey(Profiles, models.DO_NOTHING)
    thumbnail_url = models.TextField()
    likes_count = models.IntegerField(blank=True, null=True)
    forks_count = models.IntegerField(blank=True, null=True)
    views_count = models.IntegerField(blank=True, null=True)
    is_featured = models.BooleanField(blank=True, null=True)
    is_private = models.BooleanField(blank=True, null=True)
    slug = models.TextField(blank=True, null=True)
    framework = models.TextField()  # This field type is a guess.
    type = models.TextField()
    is_owner = models.BooleanField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'spaces'
        unique_together = (('author', 'slug'),)
