-- Добавить тег test для тех видео, у которых его нет

db.videos.updateMany(
{ },
{
    $addToSet: {tags: 'test'}
})

-- Вывести названия роликов с тегом test

db.videos.find(
{tags: 'test'},
{title:1, _id:0})