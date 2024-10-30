import PostCreateForm from "@/components/posts/post-create-form";

interface TopicShowPageProps {
  params: Promise<{ id: string }>;
}

export default async function TopicShowPage({ params }: TopicShowPageProps) {
  const { id } = await params;

  return (
    <div className="grid grid-cols-4 gap-4 p-4">
      <div className="col-span-3">
        <h1 className="text-2xl font-bold mb-2">{id}</h1>
      </div>

      <div>
        <PostCreateForm />
      </div>
    </div>
  );
}
