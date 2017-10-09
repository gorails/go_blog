module Blog
  class PostDecorator < Draper::Decorator
    delegate_all

    def link_to_show
      h.link_to h.blog_post_path(id: self.id),
                class: 'btn btn-info btn-sm',
                title: 'Visualizar',
                style: 'color: #FFF; float: none;' do
        h.content_tag :span, class: 'fa fa-search' do
        end
      end
    end

    def link_to_read_more
      h.link_to h.show_list_blog_posts_path(id: self.id),
                class: 'btn btn-info btn-sm',
                title: 'Visualizar',
                style: 'color: #FFF; float: none;' do
        h.content_tag :span do
          'Continue Lendo...'
        end
      end
    end

    def link_to_title
      h.link_to h.show_list_blog_posts_path(id: self.id),
                class: 'text-primary-dark',
                title: self.title do
        h.content_tag :span do
          self.title
        end
      end
    end


    def link_to_edit
      h.link_to h.edit_blog_post_path(id: self.id),
                class: 'btn btn-warning btn-sm',
                title: 'Alterar',
                style: 'color: #FFF; float: none;' do
        h.content_tag :span, class: 'fa fa-pencil' do
        end
      end
    end

    def link_to_delete
      h.link_to h.blog_post_path(id: self.id),
                method: 'delete',
                class: 'btn btn-danger btn-sm',
                title: 'Excluir',
                confirm: 'Deseja realmente excluir o registro?',
                style: 'color: #FFF; float: none;' do
        h.content_tag :span, class: 'fa fa-trash-o' do
        end
      end
    end
  end
end