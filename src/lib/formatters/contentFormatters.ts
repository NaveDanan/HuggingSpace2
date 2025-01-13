import type { Profile } from '../../types/profile';

export function formatSpaces(spaces: any[], profile: Profile) {
  return spaces.map(space => ({
    id: space.id,
    title: space.title,
    description: space.description,
    author: profile.display_name || profile.username,
    thumbnail_url: space.thumbnail_url,
    is_private: space.is_private,
    likes_count: space.likes_count,
    forks_count: space.forks_count,
    views_count: space.views_count,
    tags: space.space_tags.map((t: any) => t.tag)
  }));
}

export function formatModels(models: any[], profile: Profile) {
  return models.map(model => ({
    id: model.id,
    title: model.title,
    description: model.description,
    author: profile.display_name || profile.username,
    thumbnail_url: model.thumbnail_url,
    is_private: model.is_private,
    likes_count: model.likes_count,
    forks_count: model.forks_count,
    views_count: model.views_count,
    tags: model.model_tags.map((t: any) => t.tag)
  }));
}

export function formatDatasets(datasets: any[], profile: Profile) {
  return datasets.map(dataset => ({
    id: dataset.id,
    title: dataset.title,
    description: dataset.description,
    author: profile.display_name || profile.username,
    thumbnail_url: dataset.thumbnail_url,
    is_private: dataset.is_private,
    likes_count: dataset.likes_count,
    forks_count: dataset.forks_count,
    views_count: dataset.views_count,
    tags: dataset.dataset_tags.map((t: any) => t.tag)
  }));
}