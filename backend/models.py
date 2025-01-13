postgresql
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    id = models.IntegerField()
    name = models.CharField(max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigIntegerField()
    group_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'


class AuthPermission(models.Model):
    id = models.IntegerField()
    name = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'


class AuthUser(models.Model):
    id = models.IntegerField()
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigIntegerField()
    user_id = models.IntegerField()
    group_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_groups'


class AuthUserUserPermissions(models.Model):
    id = models.BigIntegerField()
    user_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'


class DatasetTags(models.Model):
    id = models.UUIDField()
    dataset_id = models.UUIDField(blank=True, null=True)
    tag = models.TextField()

    class Meta:
        managed = False
        db_table = 'dataset_tags'


class Datasets(models.Model):
    id = models.UUIDField()
    title = models.TextField()
    description = models.TextField()
    author_id = models.UUIDField()
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


class DjangoAdminLog(models.Model):
    id = models.IntegerField()
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type_id = models.IntegerField(blank=True, null=True)
    user_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    id = models.IntegerField()
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'


class DjangoMigrations(models.Model):
    id = models.BigIntegerField()
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class GuardianGroupobjectpermission(models.Model):
    id = models.IntegerField()
    object_pk = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    group_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'guardian_groupobjectpermission'


class GuardianUserobjectpermission(models.Model):
    id = models.IntegerField()
    object_pk = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    permission_id = models.IntegerField()
    user_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'guardian_userobjectpermission'


class ModelCommits(models.Model):
    id = models.UUIDField()
    model_id = models.UUIDField()
    author_id = models.UUIDField()
    message = models.TextField()
    created_at = models.DateTimeField(blank=True, null=True)
    files = models.TextField()  # This field type is a guess.
    hash = models.TextField()

    class Meta:
        managed = False
        db_table = 'model_commits'


class ModelFileChanges(models.Model):
    id = models.UUIDField()
    commit_id = models.UUIDField()
    file_path = models.TextField()
    change_type = models.TextField()
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'model_file_changes'


class ModelTags(models.Model):
    id = models.UUIDField()
    model_id = models.UUIDField(blank=True, null=True)
    tag = models.TextField()

    class Meta:
        managed = False
        db_table = 'model_tags'


class Models(models.Model):
    id = models.UUIDField()
    created_at = models.DateTimeField(blank=True, null=True)
    title = models.TextField()
    description = models.TextField()
    author_id = models.UUIDField()
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


class Profiles(models.Model):
    id = models.UUIDField()
    created_at = models.DateTimeField(blank=True, null=True)
    username = models.TextField()
    display_name = models.TextField(blank=True, null=True)
    avatar_url = models.TextField(blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    github_url = models.TextField(blank=True, null=True)
    website_url = models.TextField(blank=True, null=True)
    theme_preference = models.TextField(blank=True, null=True)
    github_id = models.TextField(blank=True, null=True)
    github_access_token = models.TextField(blank=True, null=True)
    github_username = models.TextField(blank=True, null=True)
    organizations = models.JSONField(blank=True, null=True)
    interests = models.TextField(blank=True, null=True)  # This field type is a guess.
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'profiles'


class Repo(models.Model):
    id = models.UUIDField()
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


class SpaceTags(models.Model):
    id = models.UUIDField()
    space_id = models.UUIDField(blank=True, null=True)
    tag = models.TextField()

    class Meta:
        managed = False
        db_table = 'space_tags'


class Spaces(models.Model):
    id = models.UUIDField()
    created_at = models.DateTimeField(blank=True, null=True)
    title = models.TextField()
    description = models.TextField()
    author_id = models.UUIDField()
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
